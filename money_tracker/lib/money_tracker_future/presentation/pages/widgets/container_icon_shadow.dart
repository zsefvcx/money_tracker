
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class ContainerIconShadow extends StatelessWidget {
  const ContainerIconShadow({
    required this.icon,
    this.color,
    super.key,
  });

  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: theme.iconTheme.size??24,
      width: theme.iconTheme.size??24,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: color,
        size: theme.iconTheme.size??24,
        shadows: CustomThemeProp.shadows,
      ),
    );
  }
}
