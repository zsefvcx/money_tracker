
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class MonthButton extends StatefulWidget {
  const MonthButton({
    required this.select,
    required this.month, super.key,
  });

  final int month;
  final bool select;

  @override
  State<MonthButton> createState() => _MonthButtonState();
}

class _MonthButtonState extends State<MonthButton> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (widget.select) select = true;
    if (widget.month == 11) {
      if (kDebugMode) {
        print(widget.month);
      }
    }
    return Stack(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() {
            select = true;
          }),
          onExit: (_) => setState(() {
            if (widget.select) {
              select = true;
            } else {
              select = false;
            }
          }),
          child: GestureDetector(
            onTap: () {

            },
            child: Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: select?theme.colorScheme.primary:theme.colorScheme.background,
              ),
              child: Center(
                child: Text(
                  NameMonth(context).toNameMonth(widget.month).substring(0,3),
                  style: theme.textTheme.displayLarge?.copyWith(
                    color: select?theme.colorScheme.background:null,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
