
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';

class DayExpenseWidget extends StatelessWidget {
  const DayExpenseWidget({
    required this.dateTimeStart,
    required this.id,
    required this.typeWidget,
    super.key
  });

  final int id;
  final int typeWidget;
  final DateTime dateTimeStart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textController= TextEditingController();
    final focusNode = FocusNode();
    final focusNodeSecond = FocusNode();
    final formKey = GlobalKey<FormState>(debugLabel: '1');
    final dateTimeNow = DateTime.now();

    final dateTime = (
      dateTimeNow.year == dateTimeStart.year &&
      dateTimeNow.month == dateTimeStart.month
    )? dateTimeNow : dateTimeStart;

    final valueNotifierDateTime  = ValueNotifier<DateTime>(dateTime);

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(typeWidget!=3?S.of(context).addExpense:S.of(context).editExpense,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20
                  )
              ),
              IconButton(onPressed: () async {
                  final localDateTime = await showDialog<DateTime>(
                    context: context,
                    builder: (_) => Dialog(
                      insetPadding: const EdgeInsets.only(left: 25, right: 25),
                      child: SelectDateTime(
                          dateTime: dateTime
                      ),
                    ),
                  );
                  if(localDateTime != null)valueNotifierDateTime.value = localDateTime;
                },
                icon: ValueListenableBuilder(
                  valueListenable: valueNotifierDateTime,
                  builder: (context, value, _) {
                    return Text(' ${value.day} ${NameMonth(context).toNameMonth(value.month).substring(0,3)} ${value.year}',
                        style: theme.textTheme.displayLarge
                    );
                  },
                ),
              ),
            ],
          ),
          30.h,
          Form(
            key: formKey,
            child: CustomTextFormField(
              controller: textController,
              autofocus: true,
              focusNode: focusNode,
              nextFocusNode: focusNodeSecond,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[-0-9]{1,100}$'))],
              labelText: S.of(context).enterAmount,
              hintText: S.of(context).enterAmount,
              validator: (value) =>
              (   value != null &&
                  RegExp(r'^(-)?\d').hasMatch(value) &&
                  BigInt.tryParse(textController.text) != null
              )
                  ?null
                  :S.of(context).thereShouldBeOnlyNumbers,
              border: OutlineInputBorder(borderSide: BorderSide(
                color: theme.colorScheme.secondaryContainer,
                width: 2,
              ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                color: theme.colorScheme.secondary,
                width: 2,
              ),
                borderRadius: BorderRadius.circular(15),
              ),
              keyboardType: TextInputType.number,
              onEditingComplete: () =>
                _onPressed(formKey, textController, valueNotifierDateTime, context),
            ),
          ),
          30.h,
          ElevatedButton(
            focusNode: focusNodeSecond,
            onPressed: () =>
              _onPressed(formKey, textController, valueNotifierDateTime, context),
            child: typeWidget!=3?Text(S.of(context).add):Text(S.of(context).modifi),
            style: theme.elevatedButtonTheme.style?.copyWith(
              minimumSize: const MaterialStatePropertyAll(Size(
                double.maxFinite,50
              )),
            )
          ),
          15.h,
          TextButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: Text(S.of(context).close,
                style: theme.dialogTheme.contentTextStyle
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(GlobalKey<FormState> formKey, TextEditingController textController, ValueNotifier<DateTime> valueNotifierDateTime, BuildContext context) {
    final cSt = formKey.currentState;
    final res = BigInt.tryParse(textController.text);
    final dateTime = valueNotifierDateTime.value;
    if (cSt != null && cSt.validate() && res != null){
      Navigator.pop(context, (res, dateTime));
    }
  }
}
