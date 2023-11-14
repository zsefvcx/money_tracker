
import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';

class CircularProgressIndicatorMod extends StatelessWidget {

  const CircularProgressIndicatorMod({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(
          left: 25, right: 25, top: 10, bottom: 25,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(tag: Keys.heroIdSplash, child: MainSplash(),),
              CircularProgressIndicator(),
            ],
          ),
        ),
    );
  }
}
