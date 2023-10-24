
import 'package:flutter/material.dart';
import 'package:package_login_or_registration/generated/l10n.dart';
import 'package:package_login_or_registration/src/core/core.dart';

class MainSplash extends StatelessWidget {
  const MainSplash({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset('assets/img/Gradient_75_93.png'),
        10.h,
        Text(S.of(context).costAccounting,
          style: theme.textTheme.titleLarge,
          textAlign: CustomThemeProp.titleLargeTypography.textAlign,
        ),
        10.h,
        SizedBox(
          width: 180,
          child: Text(S.of(context).yourExpenseHistoryIsAlwaysAtHand,
            style: theme.textTheme.titleMedium,
            textAlign: CustomThemeProp.titleMediumTypography.textAlign,
          ),
        ),
        20.h,
      ],
    );
  }
}
