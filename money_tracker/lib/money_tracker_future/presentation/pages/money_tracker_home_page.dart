import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/photo_bloc/photo_bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';

class MoneyTrackerHomePage extends StatefulWidget {

  const MoneyTrackerHomePage({
    required this.loadImage,
    required this.uuid,
    required this.eMail,
    super.key
  });

  final String uuid;
  final String eMail;
  final bool loadImage;

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
    final blocBloc = context.read<PhotoBloc>();

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
                const Hero(tag: Keys.heroIdSplash, child: CustomPieChart()),
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
                    child: Hero(tag: Keys.heroIdSplash,
                        child: CustomCircleAvatar(
                          uuid: widget.uuid,
                          loadImage: widget.loadImage,
                        )
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
            if(currentIndex == 1){
              if (widget.loadImage){
                blocBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
              } else {
                blocBloc.add(const PhotoBlocEvent.init(uuid: ''));
              }
            }

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
