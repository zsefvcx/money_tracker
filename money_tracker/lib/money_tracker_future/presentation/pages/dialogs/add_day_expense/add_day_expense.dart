
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';

class AddDayExpense extends StatelessWidget {
  const AddDayExpense({
    required this.id,
    super.key
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textController= TextEditingController();
    final focusNode = FocusNode();
    final focusNodeSecond = FocusNode();
    final formKey = GlobalKey<FormState>(debugLabel: '1');

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).addExpense),
              const Text('1 дек 2023'),
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
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('^[-0-9]{0,100}'))],
              labelText: S.of(context).enterAmount,
              hintText: S.of(context).enterAmount,
              validator: (value) =>
              (   value != null &&
                  RegExp('[-0-9]').hasMatch(value) &&
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
            ),
          ),
          30.h,
          ElevatedButton(
            focusNode: focusNodeSecond,
            onPressed: () {
              final cSt = formKey.currentState;
              final res = BigInt.tryParse(textController.text);
              if (cSt != null && cSt.validate() && res != null){
                Navigator.pop(context, res);
              }
            },
            child: Text(S.of(context).add),
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
}
