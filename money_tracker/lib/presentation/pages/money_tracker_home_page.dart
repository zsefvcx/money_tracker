import 'package:flutter/material.dart';

class MoneyTrackerHomePage extends StatelessWidget {
  static const routeName = r'\PageMoneyTracker';

  const MoneyTrackerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(DateTime.now().toString()),
          centerTitle: true,
          leading: const Icon(Icons.add),
        ),
        body: const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 25),
          child:  Center(child: Placeholder()),
        ),
        bottomSheet: const BottomAppBar(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                children: [
                  Icon(Icons.credit_card),
                  Text('Expenses'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text('Profile'),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
