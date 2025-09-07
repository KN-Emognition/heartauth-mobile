import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget{
  final String title;
  final IconData icon;
  final void Function() onTap;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: theme.onSurface),
      title: Text(
        title,
        style: TextStyle(color: theme.onSurface),
      ),
      onTap: onTap
    );
  }
}