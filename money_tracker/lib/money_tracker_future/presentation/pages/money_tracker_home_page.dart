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
  CategoriesExpensesModels? categories;

  void setMonthCurrent(MonthCurrent monthCurrent){
    setState(() {
      _monthCurrent = monthCurrent;
    });
  }

  @override
  void initState() {
    _monthCurrent = widget.monthCurrent;
    final photoBloc = context.read<PhotoBloc>();
    final categoriesBloc = context.read<CategoriesBloc>()
      ..add(CategoriesBlocEvent.init(uuid: widget.uuid));

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        categoriesBloc.add(CategoriesBlocEvent.init(uuid: widget.uuid));
      } else if (_tabController.index == 1) {
        if (widget.loadImage) {
          photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
        } else {
          photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
        }
      }
      setState(() {
        _currentTabIndex = _tabController.index;
      });

      if (_tabController.indexIsChanging) {
        // Tab Changed tapping on new tab

      } else if(_tabController.index != _tabController.previousIndex) {
        // Tab Changed swiping to a new tab
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

//https://dartpad.dev/?id=6ef0d738ca732aab0f45c92d3390310f&null_safety=true

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    //final photoBloc = context.read<PhotoBloc>();
    //final categoriesBloc = context.read<CategoriesBloc>();
    // if(_tabController.index == 0) {
    //   _currentTabIndex = 0;
    //   categoriesBloc.add(CategoriesBlocEvent.init(uuid: widget.uuid));
    // } else if(_tabController.index == 1){
    //   _currentTabIndex = 1;
    //   if (widget.loadImage){
    //     photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
    //   } else {
    //     photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
    //   }
    // }
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
                monthCurrent: _monthCurrent,
                icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (context, state) {
                           
              final res = state.map(
                loading: (_) {
                  return const CircularProgressIndicatorMod();
                },
                loaded: (value) {
                  final localCategories = value.model;
                  if (localCategories == null){
                    categories = null;
                    return ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                      uuid: widget.uuid,
                    );
                  }
                  categories = localCategories;
                  return Text(S.of(context).dataLoaded);
                },
                error: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: widget.uuid,
                ),
                timeOut: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: widget.uuid,
                ),
              );

              final localCategories = categories;
              if(localCategories != null){
                return Provider.value(
                  value: this,
                  child: MainTabWidget(
                    uuid: widget.uuid,
                    monthCurrent: widget.monthCurrent,
                    categories: localCategories,
                  ),
                );
              }  
              return res;
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
          // if(currentIndex == 1){
          //   if (widget.loadImage){
          //     photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
          //   } else {
          //     photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
          //   }
          // }

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
