const triggerPath = '/heartauth/v1/auth/trigger';
const resultPath = '/heartauth/v1/auth/result';
const healthCheckTriggerPath = '/heartauth/v1/health/trigger';
const healthCheckResultPath = '/heartauth/v1/health/result';

const typeChallenge = 'challenge';
const typeResult = 'result';

typedef EpochMillis = int;

class TriggerRequest {
  final String id;
  final EpochMillis expiresAt;
  final int measurementDurationMs;

  const TriggerRequest({
    required this.id,
    required this.expiresAt,
    required this.measurementDurationMs,
  });

  factory TriggerRequest.expiresIn({
    required String id,
    required int ttlMs,
    required int measurementDurationMs,
  }) {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    return TriggerRequest(
      id: id,
      expiresAt: now + ttlMs,
      measurementDurationMs: measurementDurationMs,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': typeChallenge,
    'id': id,
    'expiresAt': expiresAt,
    'measurementDurationMs': measurementDurationMs,
  };

  factory TriggerRequest.fromJson(Map<String, dynamic> json) {
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    final expiresAt =
        (json['expiresAt'] as num?)?.toInt() ??
        (((json['ttlMs'] as num?)?.toInt() ?? 0) + now);

    return TriggerRequest(
      id: json['id'] as String,
      expiresAt: expiresAt,
      measurementDurationMs: (json['measurementDurationMs'] as num).toInt(),
    );
  }
}

class TriggerResponse {
  final String id;
  final bool ok;
  final List<double> data;

  const TriggerResponse({
    required this.id,
    required this.ok,
    this.data = const [],
  });

  Map<String, dynamic> toJson() => {
    'type': typeResult,
    'id': id,
    'ok': ok,
    if (ok) 'data': data,
  };

  factory TriggerResponse.fromJson(Map<String, dynamic> json) {
    final ok = json['ok'] as bool? ?? false;
    List<double> _parseData(dynamic v) =>
        v is List ? v.map((e) => (e as num).toDouble()).toList() : const [];
    return TriggerResponse(
      id: json['id'] as String,
      ok: ok,
      data: ok ? _parseData(json['data']) : const [],
    );
  }
}
