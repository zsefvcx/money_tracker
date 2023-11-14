import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MoneyTrackerHomePage extends StatefulWidget {

  const MoneyTrackerHomePage({
    required this.loadImage,
    required this.uuid,
    required this.eMail,
    required this.monthCurrent,
    super.key
  });

  final String uuid;
  final String eMail;
  final bool loadImage;
  final MonthCurrent monthCurrent;

  @override
  State<MoneyTrackerHomePage> createState() => MoneyTrackerHomePageState();
}

class MoneyTrackerHomePageState extends State<MoneyTrackerHomePage>  with TickerProviderStateMixin{
  int _currentTabIndex = 0;
  late TabController _tabController;
  late MonthCurrent _monthCurrent;

  void setMonthCurrent(MonthCurrent monthCurrent){
    setState(() {
      _monthCurrent = monthCurrent;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _monthCurrent = widget.monthCurrent;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final photoBloc = context.read<PhotoBloc>();
    final categoriesBloc = BlocFactory.instance.get<CategoriesBloc>()
      ..add(CategoriesBlocEvent.init(
        uuid: widget.uuid,
      ));

    var logoutProcess = false;
    return Scaffold(
      appBar: AppBar(
        title: _currentTabIndex==0
            ? Provider.value(
            value: this,
            child: AppCalendarDialog(
                uuid: widget.uuid,
                monthCurrent: _monthCurrent))
            : Text(S.of(context).profile),
        actions: [
          Visibility(
            visible: _currentTabIndex==0,
            child: AddCategoryDialog(
                uuid: widget.uuid,
                monthCurrent: _monthCurrent
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (context, state) {
              return state.map(
                loading: (_)=> const Padding(
                    padding: EdgeInsets.only(
                      left: 25, right: 25, top: 10, bottom: 25,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                ),
                loaded: (value) {
                  final localCategories = value.model;
                  if (localCategories == null){
                    return ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                      uuid: widget.uuid,
                    );
                  }
                  final length = localCategories.categoriesId.length;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(tag: Keys.heroIdSplash, child: CustomPieChart(
                          categoriesExpensesModels: localCategories
                      )),
                      Expanded(
                        child: ListView.builder(
                          itemCount: length,
                          itemBuilder: (_, index) {
                            return CustomCard(
                                categoryExpenses: localCategories.categoriesId.elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: widget.uuid,
                ),
                timeOut: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: widget.uuid,
                ),
              );
            },
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
                      }, child: Text(S.of(context).exit),
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
              photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
            } else {
              photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
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
    );
  }
}
