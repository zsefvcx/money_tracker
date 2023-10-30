
import 'package:money_tracker/login_future/domain/bloc/bloc_factory.dart';
import 'package:money_tracker/login_future/domain/bloc/user_auth_bloc.dart';

class MainBloc{
  static late final GetUserAuthBloc getUserAuthBloc;
}


class MainBlocInit {
  static void initState() {
    BlocFactory.instance.initialize();
    MainBloc.getUserAuthBloc = BlocFactory.instance.get<GetUserAuthBloc>();
    MainBloc.getUserAuthBloc.add(const UserAuthEvent.init());
  }

}
