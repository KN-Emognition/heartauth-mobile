import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/wearos_provider.dart';
import 'package:hauth_mobile/utils/watch/contract.dart';
import 'package:hauth_mobile/utils/watch/trigger_and_wait.dart';
import 'package:hauth_mobile/widgets/future_provider_view_builder.dart';

class WatchDebugApp extends HookConsumerWidget {
  const WatchDebugApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureProviderViewBuilder(
      provider: wearOSProvider,
      viewBuilder: (con, rf, wear) {
        return MaterialApp(
          title: 'Trigger Demo',
          theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
          home: TriggerPage(wear),
        );
      },
    );
  }
}

class TriggerPage extends StatefulWidget {
  const TriggerPage(
    this.wear, {
    super.key,
    this.ttlMs = 60000,
    this.measurementDurationMs = 10000,
  });

  final FlutterWearOsConnectivity wear;
  final int ttlMs;
  final int measurementDurationMs;

  @override
  State<TriggerPage> createState() => _TriggerPageState();
}

class _TriggerPageState extends State<TriggerPage> {
  bool _isWaiting = false;
  DateTime? _deadline;
  int _remainingMs = 0;
  Timer? _ticker;

  int _generation = 0;

  TriggerResponse? _lastResponse;
  String? _lastError;

  // New state: username controller and sample length in seconds
  late final TextEditingController _usernameController;
  late int _sampleLengthSec;

  @override
  void initState() {
    super.initState();
    // initialize username controller and sample length from widget
    _usernameController = TextEditingController();
    _sampleLengthSec = (widget.measurementDurationMs ~/ 1000).clamp(8, 30);
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _startTrigger({bool force = false}) async {
    if (_isWaiting && !force) return;

    final nextGen = _generation + 1;

    final expiresAtUtc =
        DateTime.now().toUtc().millisecondsSinceEpoch + widget.ttlMs;

    setState(() {
      _isWaiting = true;
      _lastError = null;
      _lastResponse = null;

      _deadline = DateTime.fromMillisecondsSinceEpoch(
        expiresAtUtc,
        isUtc: true,
      ).toLocal();
      _remainingMs = widget.ttlMs;
      _generation = nextGen;
    });

    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (_deadline == null) return;
      final nowLocal = DateTime.now();
      final left = _deadline!.difference(nowLocal).inMilliseconds;
      setState(() {
        _remainingMs = left.clamp(0, 0x7FFFFFFF);
      });
      if (left <= 0) {
        _ticker?.cancel();
      }
    });

    final localGen = nextGen;

    try {
      // Use the selected sample length and pass username (if any)
      final measurementMs = _sampleLengthSec * 1000;
      final username = _usernameController.text.trim().isEmpty
          ? null
          : _usernameController.text.trim();

      final result = await triggerAndWait(
        wear: widget.wear,
        expiresAt: expiresAtUtc,
        measurementDurationMs: measurementMs,
        // pass username as a named parameter so backend can prefix saved filename
        username: username,
      );

      if (!mounted || localGen != _generation) return;

      setState(() {
        _isWaiting = false;
        _ticker?.cancel();
        _deadline = null;
        _remainingMs = 0;
        _lastResponse = result;
      });
    } catch (e) {
      if (!mounted || localGen != _generation) return;
      setState(() {
        _isWaiting = false;
        _ticker?.cancel();
        _deadline = null;
        _remainingMs = 0;
        _lastError = e.toString();
      });
    }
  }

  void _retrigger() {
    _startTrigger(force: true);
  }

  String _formatMs(int ms) {
    final totalMillis = ms.clamp(0, 999 * 60 * 60 * 24);
    final seconds = (totalMillis ~/ 1000) % 60;
    final minutes = (totalMillis ~/ 60000);
    final hundredths = ((totalMillis % 1000) ~/ 10);
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    final hh = hundredths.toString().padLeft(2, '0');
    return '$mm:$ss.$hh';
  }

  @override
  Widget build(BuildContext context) {
    final waitingText = _isWaiting
        ? "Waiting for response…"
        : "Idle. Press the button to send a trigger.";

    return Scaffold(
      appBar: AppBar(title: const Text('Trigger & Wait Demo')),
      // Replaced fixed Padding+Column with a scrollable view that accounts for the on-screen keyboard.
      body: Builder(builder: (context) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.timer),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(waitingText),
                            const SizedBox(height: 6),
                            Text(
                              "Time left: ${_formatMs(_remainingMs)}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // New: Username input and sample length slider
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username field
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username (prefix saved filename)',
                          hintText: 'enter username',
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Slider + +-buttons
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sample length: $_sampleLengthSec s'),
                                Slider(
                                  value: _sampleLengthSec.toDouble(),
                                  min: 8,
                                  max: 30,
                                  divisions: 22,
                                  label: '$_sampleLengthSec s',
                                  onChanged: (v) {
                                    setState(() {
                                      _sampleLengthSec = v.round();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Plus and minus buttons to the right for fine adjustments
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _sampleLengthSec = (_sampleLengthSec + 1)
                                        .clamp(8, 30);
                                  });
                                },
                              ),
                              const SizedBox(height: 4),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _sampleLengthSec = (_sampleLengthSec - 1)
                                        .clamp(8, 30);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              if (!_isWaiting)
                FilledButton.icon(
                  icon: const Icon(Icons.flash_on),
                  label: Text("Send Trigger"),
                  onPressed: () => _startTrigger(),
                )
              else
                FilledButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: Text("Retrigger"),
                  onPressed: _retrigger,
                ),

              const SizedBox(height: 16),

              if (_lastResponse != null || _lastError != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _lastError != null
                          ? Text(
                              "Error: ${_lastError ?? ''}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            )
                          : Text(
                              "Last response: ok=${_lastResponse!.ok} id=${_lastResponse!.id}",
                            ),
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
