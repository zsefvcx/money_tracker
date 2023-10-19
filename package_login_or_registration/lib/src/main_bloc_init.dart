
import 'package:package_login_or_registration/src/domain/bloc/bloc_factory.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';

class MainBlocInit {

  static late final GetUserAuthBloc getUserAuthBloc;

  static void initState() {
    BlocFactory.instance.initialize();
    getUserAuthBloc = BlocFactory.instance.get<GetUserAuthBloc>();
    getUserAuthBloc.add(const UserAuthEvent.init());
  }

}
