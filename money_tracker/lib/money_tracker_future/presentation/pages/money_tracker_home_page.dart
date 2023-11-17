import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';
import 'package:provider/provider.dart';

class MoneyTrackerHomePage extends StatefulWidget {
  const MoneyTrackerHomePage({super.key});

  @override
  State<MoneyTrackerHomePage> createState() => MoneyTrackerHomePageState();
}

class MoneyTrackerHomePageState extends State<MoneyTrackerHomePage>  with TickerProviderStateMixin{

  late TabController _tabController;
  late MonthCurrent _monthCurrent;
  final _valueNotifierPage = ValueNotifier<int>(0);

  CategoriesExpensesModels? categories;

  void setMonthCurrent(MonthCurrent monthCurrent){
    setState(() {
      _monthCurrent = monthCurrent;
    });
  }

  @override
  void initState() {
    final statusUserProp = context.read<StatusUserProp>();
    _monthCurrent = statusUserProp.monthCurrent;
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _valueNotifierPage.value = _tabController.index;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusUserProp = context.read<StatusUserProp>();

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: _valueNotifierPage,
          builder: (_, value, __) => value==0
            ? Provider.value(
                value: this,
                child: AppCalendarDialog(
                  uuid: statusUserProp.uuid,
                  monthCurrent: _monthCurrent))
            : Text(S.of(context).profile),
        ),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _valueNotifierPage,
            builder: (_, value, __) => Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: value==0,
                    child: AddCategory(
                      uuid: statusUserProp.uuid,
                      monthCurrent: _monthCurrent,
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<CategoriesBloc, CategoriesBlocState>(
            builder: (_, state) {
              final res = state.map(
                loading: (_) {
                  return const CircularProgressIndicatorMod();
                },
                loaded: (value) {
                  final localCategories = value.model;
                  if (localCategories == null){
                    categories = null;
                    return ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                      uuid: statusUserProp.uuid,
                    );
                  }
                  categories = localCategories;
                  return Text(S.of(context).dataLoaded);
                },
                error: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: statusUserProp.uuid,
                ),
                timeOut: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesModels?>(
                  uuid: statusUserProp.uuid,
                ),
              );
              final localCategories = categories;
              if(localCategories != null){
                return Provider.value(
                  value: this,
                  child: MainTabWidget(
                    uuid: statusUserProp.uuid,
                    monthCurrent: statusUserProp.monthCurrent,
                    categories: localCategories,
                  ),
                );
              }  
              return res;
            },
          ),
          const ProfileTabWidget(),
        ],
      ),

      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _valueNotifierPage,
        builder: (_, value, __) => BottomNavigationBar(
          onTap: (currentIndex) {
            _tabController.index = currentIndex;
            value = currentIndex;
            _tabController.animateTo(value);
          },
          currentIndex: value,
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
