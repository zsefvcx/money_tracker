import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/dialogs/dialogs.dart';
import 'package:money_tracker/money_tracker_future/presentation/presentation.dart';

class MoneyTrackerHomePage extends StatefulWidget {
  static const routeName = r'\MoneyTrackerHomePage';

  const MoneyTrackerHomePage({
    required this.statusUserProp,
    super.key
  });

  final StatusUserProp statusUserProp;

  @override
  State<MoneyTrackerHomePage> createState() => _MoneyTrackerHomePageState();
}

class _MoneyTrackerHomePageState extends State<MoneyTrackerHomePage>
    with TickerProviderStateMixin {

  late TabController _tabController;
  final _valueNotifierPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _valueNotifierPage.value = _tabController.index;
    });

  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    context.read<CategoriesBloc>()
        .add(CategoriesBlocEvent.init(uuid: widget.statusUserProp.uuid));
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<int>(
          valueListenable: _valueNotifierPage,
          builder: (_, value, __) => value==0
            ? AppCalendarDialog(
            uuid: widget.statusUserProp.uuid,
            monthCurrent: widget.statusUserProp.monthCurrent)
            : StackTextTwice(
             text: S.of(context).profile,
             color: theme.appBarTheme.backgroundColor,
            )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: ValueListenableBuilder<int>(
            valueListenable: _valueNotifierPage,
               builder: (_, value, __) => Visibility(
               visible: value==0,
               child: AddEditCategory(
                 contextMacro: context,
                 statusUserProp: widget.statusUserProp,
                 icon: const ContainerIconShadow(
                     icon: Icons.add
                 ),
               )),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            BlocBuilder<CategoriesBloc, CategoriesBlocState>(
              builder: (_, state) {
                return state.map(
                  loading: (_) {
                    return const CircularProgressIndicatorMod();
                  },
                  loaded: (value) {
                    final localCategories = value.entity;
                    if (localCategories == null){
                      return ErrorTimeOut<CategoriesBloc, CategoriesExpensesEntity?>(
                        uuid: widget.statusUserProp.uuid,
                      );
                    }
                    return MainTabWidget(
                        statusUserProp: widget.statusUserProp,
                        categories: localCategories,
                    );
                  },
                  error: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesEntity?>(
                    uuid: widget.statusUserProp.uuid,
                  ),
                  timeOut: (value) => ErrorTimeOut<CategoriesBloc, CategoriesExpensesEntity?>(
                    uuid: widget.statusUserProp.uuid,
                  ),
                );
              },
            ),
            ProfileTabWidget(
              statusUserProp: widget.statusUserProp
            ),
          ],
        ),
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
                child: ContainerIconShadow(
                  icon: Icons.credit_card,
                ),
              ),
              label: S.of(context).expenses,
            ),
            BottomNavigationBarItem(icon:
            const Padding(
              padding: EdgeInsets.only(bottom: 3),
              child: ContainerIconShadow(
                icon: Icons.person,
              ),
            ),
              label: S.of(context).profile,

            ),
          ],
        ),
      ),
    );
  }
}
