
part of 'month_year_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectMonthNotifier = context.read<_MonthYearWidgetState>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          selectMonthNotifier.select(widget.month);
        },
        child: Container(
          width: 50, height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: selectMonthNotifier.selectMonth==widget.month?theme.colorScheme.primary:theme.colorScheme.background,
          ),
          child: Center(
            child: Text(
              NameMonth(context).toNameMonth(widget.month).substring(0,3),
              style: theme.textTheme.displayLarge?.copyWith(
                color: widget.select?theme.dialogTheme.iconColor:null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
