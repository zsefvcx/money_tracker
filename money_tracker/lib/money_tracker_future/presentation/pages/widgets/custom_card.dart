
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.categoryExpenses, super.key});

  
  final CategoryExpenses categoryExpenses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => showDialog<String>(
          context: context,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('This is a typical dialog.'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 21),
            height: 65,
            //width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          categoryExpenses.name, 
                          style: theme.textTheme.titleMedium
                      ),
                      9.h,
                      Text('Всего 3800', style:  theme.textTheme.bodySmall,),
                    ],
                  ),
                ),
                IconButton(onPressed: () {

                }, icon: Icon(
                    Icons.arrow_forward_ios, 
                    color: Color(int.parse('FF${categoryExpenses.colorHex}', radix: 16))
                ),
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}
