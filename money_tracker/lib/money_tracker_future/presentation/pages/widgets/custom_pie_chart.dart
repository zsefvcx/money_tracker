
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({required this.categoriesExpensesModels, super.key});

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
    return Container(
      color: theme.colorScheme.secondary,
      height: 240,
      width: double.maxFinite,
      padding: const EdgeInsets.all(30),
      child: Center(
        child: categoriesId.isNotEmpty?AspectRatio(
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
              sectionsSpace: 0,
              centerSpaceRadius: 30,
              sections: showingSections(context),
            ),
          ),
        ):const Text('За октябрь нет расходов'),
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
