import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/presentation/pages/widgets/custom_card.dart';
import 'package:money_tracker/presentation/pages/widgets/custom_pie_chart.dart';

class MoneyTrackerHomePage extends StatefulWidget {
  static const routeName = r'\PageMoneyTracker';

  const MoneyTrackerHomePage({super.key});

  @override
  State<MoneyTrackerHomePage> createState() => _MoneyTrackerHomePageState();
}

class _MoneyTrackerHomePageState extends State<MoneyTrackerHomePage>  with TickerProviderStateMixin{
  int _currentTabIndex = 0;
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final nowDateTime = DateTime.now();
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _currentTabIndex==0
              ? Text('${NameMonth(context).toNameMonth(nowDateTime.month)} ${nowDateTime.year}')
              : Text(S.of(context).profile),
          actions: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.add)),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomPieChart(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return CustomCard(index: index);
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: theme.colorScheme.secondary,
                        child: const Center(child: Icon(Icons.photo_camera, size: 36, color: Colors.grey,)),
                        radius: 40,
                      ),
                      13.h,
                      TextButton(onPressed: () {

                      }, child: Text('Сохранить', style: theme.textTheme.bodyLarge,)),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('test@test.ruddddddddd', style: theme.textTheme.bodyMedium),
                        13.h,
                        Expanded(
                          child: ElevatedButton(onPressed: () {

                          }, child: const Text('Выйти'),
                           style: theme.elevatedButtonTheme.style?.copyWith(
                             minimumSize: const MaterialStatePropertyAll(Size(
                                 double.minPositive,50
                             ))
                           ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),



        bottomNavigationBar: BottomNavigationBar(
          onTap: (currentIndex) {
            _tabController.index = currentIndex;
            setState(() {
              _currentTabIndex = currentIndex;
              _tabController.animateTo(_currentTabIndex);
            });
          },
          currentIndex: _currentTabIndex,
          items: [
            BottomNavigationBarItem(icon:
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(Icons.credit_card),
              ),
              label: S.of(context).expenses,
            ),
            BottomNavigationBarItem(icon:
              const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Icon(Icons.person),
              ),
              label: S.of(context).profile,
            ),
          ],
        ),
      ),
    );
  }
}
