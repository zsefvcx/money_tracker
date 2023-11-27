
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class StackTextTwice extends StatelessWidget {
  const StackTextTwice({
    required this.text,
    required this.color,
    super.key,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(child: Stack(
      children: [
        Text(text,
          style: theme.appBarTheme.titleTextStyle?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.black,
            shadows: CustomThemeProp.shadows,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(text,
          style: theme.appBarTheme.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
      color: color,
    );
  }
}
