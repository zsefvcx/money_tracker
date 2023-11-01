import 'dart:async';

import 'package:money_tracker/login_future/domain/bloc/bloc.dart';

class LoginBlocInit {
  static late final UserAuthBloc getUserAuthBloc;

  static void initState() {
    BlocFactory.instance.initialize();
    getUserAuthBloc = BlocFactory.instance.get<UserAuthBloc>();
    getUserAuthBloc.add(const UserAuthEvent.init());
  }

  static Future<void> logout() async {
    final completer = Completer<bool>();
    getUserAuthBloc.add(UserAuthEvent.logout(completer: completer));
    await completer.future;
  }

  static Future<void> changeLoadImageStatus({required bool status}) async {
    final completer = Completer<bool>();
    getUserAuthBloc.add(UserAuthEvent.changeLoadImageStatus(status: status, completer: completer));
    await completer.future;
  }

}
