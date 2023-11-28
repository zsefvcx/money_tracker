
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class StackTextTwice extends StatelessWidget {
  const StackTextTwice({
    required this.text,
    this.color,
    this.style,
    super.key,
  });

  final String text;
  final Color? color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final localStyle = style??Theme.of(context).appBarTheme.titleTextStyle;
    return Material(child: Stack(
      children: [
        Text(text,
          style: localStyle?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.black,
            shadows: CustomThemeProp.shadows,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(text,
          style: localStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
      color: color,
    );
  }
}
