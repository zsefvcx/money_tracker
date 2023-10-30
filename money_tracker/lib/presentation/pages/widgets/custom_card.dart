
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
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
                  Text('Dog $index', style: theme.textTheme.titleMedium),
                  9.h,
                  Text('Всего 3800', style:  theme.textTheme.bodySmall,),
                ],
              ),
            ),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ) ,
    );
  }
}
