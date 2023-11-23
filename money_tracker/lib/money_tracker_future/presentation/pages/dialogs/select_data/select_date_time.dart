
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({
    required this.dateTime,
    super.key
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final textController= TextEditingController()..text = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 110,
          padding: const EdgeInsets.only(
            bottom: 30, top: 15,
            left: 25, right: 25,
          ),
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).selectDate,
                      style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 12,
                          color:  theme.colorScheme.background
                      )
                  ),
                  10.h,
                  Text('${dateTime.day} ${NameMonth(context).toNameMonth(dateTime.month).substring(0,3)} ${dateTime.year}, ${NameWeekday(context).toNameWeekday(dateTime.weekday)}',
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color:  theme.colorScheme.background
                      )
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.calendar_today_rounded, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 25, right: 25,
          ),
          child: Column(
            children: [
              CustomTextFormField(
                  controller: textController,
                  hintText: S.of(context).enterDate,
                  labelText: 'Дата',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[- /.0-9]{1,10}$')
                    )
                  ],
                  validator: (value) =>
                  (   value != null &&
                      RegExp(r'^(0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2}$').hasMatch(value)
                  )
                      ?null
                      :'Ошибка формата даты'
              ),
              30.h,
              ElevatedButton(onPressed: () {
                final data = textController.text;
                final space = data.contains(' ');
                final dot = data.contains('.');
                final slash = data.contains('/');
                final result = data.split(
                    space?' ':(dot?'.':(slash?'/':'/'))
                );
                if(result.length == 3){
                  final date = result[0];
                  final month= result[1];
                  final year = result[2];
                  final stringSelectedDateTime =
                      '${year.length==2?'20$year':year}'
                      '-${month.length==1?'0$month':month}'
                      '-${date.length==1?'0$date':date}'
                      ' 00:00:00.000000';
                  final dateTime = DateTime.tryParse(stringSelectedDateTime);
                  Navigator.pop(context, dateTime);
                } else {
                  Navigator.pop(context, null);
                }
              },
                child: Text(S.of(context).confirm),
                style: theme.elevatedButtonTheme.style?.copyWith(

                  minimumSize: const MaterialStatePropertyAll(Size(
                      double.maxFinite,50
                  )),
                ),
              ),
              15.h,
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).close,
                    style: theme.dialogTheme.contentTextStyle
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
