
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';

class DeleteCategoryDialog extends StatelessWidget {
  const DeleteCategoryDialog({
    required this.name,
    super.key
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            children: [
              Text(S.of(context).removeCategory, style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 20
              )),
              Row(
                children: [
                  Expanded(
                    child: Text(S.of(context).name_category(name),
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: theme.colorScheme.primary
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('?', style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20
                  )),
                ],
              ),
            ],
          ),
          30.h,
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(S.of(context).confirm),
              style: theme.elevatedButtonTheme.style?.copyWith(
                minimumSize: const MaterialStatePropertyAll(Size(
                    double.maxFinite,50
                )),
              )
          ),
          15.h,
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(S.of(context).close, style: theme.dialogTheme.contentTextStyle),
          ),
        ],
      ),
    );
  }
}
