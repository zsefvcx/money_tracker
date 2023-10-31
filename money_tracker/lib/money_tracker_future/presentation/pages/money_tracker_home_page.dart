import 'package:flutter/material.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';

class MoneyTrackerHomePage extends StatefulWidget {
  static const routeName = r'\PageMoneyTracker';

  const MoneyTrackerHomePage({required this.uuid, required this.eMail, super.key});

  final String uuid;
  final String eMail;

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
    var logoutProcess = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _currentTabIndex==0
              ? Text('${NameMonth(context).toNameMonth(nowDateTime.month)} ${nowDateTime.year}')
              : Text(S.of(context).profile),
          actions: [
            if(_currentTabIndex==0)IconButton(onPressed: () => showDialog<String>(
                context: context,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('This is a typical dialog.'),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ), icon: const Icon(Icons.add)),
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
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 119,
                    child: Column(
                      children: [
                        const CustomCircleAvatar(),
                        13.h,
                        TextButton(onPressed: () {

                        }, child: Text('Сохранить', style: theme.textTheme.bodyLarge,)),
                        13.h,
                        Expanded(child: Text(widget.uuid, style: theme.textTheme.bodyMedium, textDirection: TextDirection.ltr,)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.eMail, style: theme.textTheme.bodyMedium),
                        13.h,
                        ElevatedButton(onPressed: () {
                          if(logoutProcess) return;
                          logoutProcess = true;
                          LoginBlocInit.logout();
                          Navigator.of(context).pushReplacementNamed(r'\',
                                  arguments: {
                                    'loginUser': false,
                                  },
                          );

                          // final res = await LoginBlocInit.logout();
                          // if (res && mounted){
                          //   await Navigator.of(context).pushReplacementNamed(r'\',
                          //     arguments: {
                          //       'newUser': false,
                          //       'statusAuthorization':false,
                          //     },
                          //   );
                          // }
                          logoutProcess = false;
                        }, child: const Text('Выйти'),
                         style: theme.elevatedButtonTheme.style?.copyWith(

                           minimumSize: MaterialStatePropertyAll(Size(
                               MediaQuery.of(context).size.width-80-50-25,50
                           )),
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
