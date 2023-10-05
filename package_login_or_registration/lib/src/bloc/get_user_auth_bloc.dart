import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_auth_event.dart';
part 'get_user_auth_state.dart';
part 'get_user_auth_bloc.freezed.dart';


class GetUserAuthBloc extends Bloc<GetUserAuthEvent, GetUserAuthState> {
  GetUserAuthBloc() : super(const GetUserAuthInitial()) {
    on<GetUserAuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
