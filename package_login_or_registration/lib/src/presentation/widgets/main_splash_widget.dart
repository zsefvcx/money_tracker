
import 'package:flutter/material.dart';
import 'package:package_login_or_registration/src/core/core.dart';

class MainSplashWidget extends StatelessWidget {
  const MainSplashWidget({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset('assets/img/Gradient_75_93.png'),
        // const Icon(
        //   Icons.import_contacts,
        //   size: 150,
        // ),
        10.h,
        Text('Учет доходов',
          style: theme.textTheme.titleLarge?.copyWith(
              fontFamily: 'SF UI Display',
              fontSize: 24,
              height: 24/15,//When height is non-null, the line height of the span of text will be a multiple of fontSize and be exactly fontSize * height logical pixels tall.
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 180,
          child: Text('Ваша история доходов всегда под рукой',
            style: theme.textTheme.bodyLarge?.copyWith(
                fontFamily: 'SF UI Display',
                fontSize: 15,
                height: 17/15,//When height is non-null, the line height of the span of text will be a multiple of fontSize and be exactly fontSize * height logical pixels tall.
                fontWeight: FontWeight.normal
            ),
            textAlign: TextAlign.center,
          ),
        ),
        20.h,
      ],
    );
  }
}