
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class StackContainerIconTwice extends StatelessWidget {
  const StackContainerIconTwice({
    required this.icon,
    this.color,
    super.key,
  });

  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: (theme.iconTheme.size??24)+2,
          width: (theme.iconTheme.size??24)+2,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: const Color(0xFF000000),
            size: (theme.iconTheme.size??24)+2,
            shadows: CustomThemeProp.shadows,
          ),
        ),
        Container(
          height: (theme.iconTheme.size??24)+2,
          width: (theme.iconTheme.size??24)+2,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: color,
            size: theme.iconTheme.size??24,
          ),
        ),
      ],
    );
  }
}
