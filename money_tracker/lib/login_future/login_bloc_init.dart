import 'dart:async';

import 'package:money_tracker/login_future/domain/bloc/bloc_factory.dart';
import 'package:money_tracker/login_future/domain/bloc/user_auth_bloc.dart';

class LoginBlocInit {
  static late final GetUserAuthBloc getUserAuthBloc;

  static void initState() {
    BlocFactory.instance.initialize();
    getUserAuthBloc = BlocFactory.instance.get<GetUserAuthBloc>();
    getUserAuthBloc.add(const UserAuthEvent.init());
  }

  static Future<bool> logout() async {
    final completer = Completer<bool>();
    getUserAuthBloc.add(UserAuthEvent.logout(completer: completer));
    return await completer.future;
  }

}
