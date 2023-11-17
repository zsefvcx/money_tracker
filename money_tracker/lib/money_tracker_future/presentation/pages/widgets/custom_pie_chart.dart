
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    required this.categoriesExpensesModels,
    super.key
  });

  final CategoriesExpensesModels categoriesExpensesModels;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesId = widget.categoriesExpensesModels.categoriesId;
    final statusUserProp = context.read<StatusUserProp>();
    return Container(
      color: theme.colorScheme.secondary,
      height: 240,
      width: double.maxFinite,
      padding: const EdgeInsets.all(30),
      child: Center(
        child: categoriesId.isNotEmpty
            ?AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = pieTouchResponse
                        .touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 1,
              centerSpaceRadius: 30,
              sections: showingSections(context),
            ),
          ),
        )
            :Text(
               S.of(context).thereAreNoExpensesForMonthName(
               NameMonth(context).toNameMonth(statusUserProp.monthCurrent.month))
            ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesId = widget.categoriesExpensesModels.categoriesId;
    return List.generate(categoriesId.length, (i){
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
        color: Color(int.parse('FF${categoriesId.elementAt(i).colorHex}', radix: 16)),
        value: 40,
        title: categoriesId.elementAt(i).name,
        radius: radius,
        titleStyle: theme.textTheme.displaySmall,
      );
    });
  }
}
