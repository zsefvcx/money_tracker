import 'dart:async';

//import 'package:injectable/injectable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/domain/domain.dart';

part 'user_auth_bloc.freezed.dart';
part 'user_auth_event.dart';
part 'user_auth_state.dart';

//@injectable
class UserAuthData {

  final bool timeOut;
  final UserAuthorizationPasswordEntity? data;
  final String eMail;
  final bool statusAuthorization;
  final bool error;
  final String e;

  bool? get isLoaded => data?.statusAuthorization;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const UserAuthData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
    this.eMail = '',
    this.statusAuthorization = false,
  });

  UserAuthData copyWithData({
    UserAuthorizationPasswordEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
    String? eMail,
    bool? statusAuthorization,
  }){
    return UserAuthData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
      eMail: eMail ?? this.eMail,
      statusAuthorization: statusAuthorization ?? this.statusAuthorization,
    );
  }
}

//@injectable
class GetUserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {

  final GetUserAuthRepository getUserAuthRepository;
  final SetUserAuthRepository setUserAuthRepository;

  static int timeOutV = 10;

  UserAuthData userAuthData = const UserAuthData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  GetUserAuthBloc({
    required this.getUserAuthRepository,
    required this.setUserAuthRepository,
  }) : super(const UserAuthState.loading()) {
    on<UserAuthEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
          init: (value) async {
            emit(const UserAuthState.loading());
            final (error, timeOut, e, res) = await _runGoSData<UserAuthorizationPasswordEntity>(
              function: () async => await  getUserAuthRepository.loadUserData(),
            );
            userAuthData = userAuthData.copyWithData(
              data: res,
              error: error,
              e: e,
              timeOut: timeOut,
            );
            await _response(emit);
            final compl =  value.completer;
            if(compl != null){
              if (error){
                Logger.print('Error init.:$timeOut:$e', name: 'err', error: true);
                compl.completeError(error);
              } else {
                compl.complete(res);
              }
            }
          },
          updateUserData: (value) async {
            emit(const UserAuthState.loading());
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async => await setUserAuthRepository.updateUserData(value: value.value),
            );
            final data = (res==null || !res)?null:value.value;
            userAuthData = userAuthData.copyWithData(
              data: data,
              error: error,
              e: e,
              timeOut: timeOut,
              statusAuthorization: res,
            );
            await _response(emit);
            value.completer.complete();
          },
          logout: (value) async {
            emit(const UserAuthState.loading());
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async => await setUserAuthRepository.logout(),
            );
            userAuthData = userAuthData.copyWithData(
              error: error,
              e: e,
              timeOut: timeOut,
              statusAuthorization: res??false,
            );

            await _response(emit);
            value.completer.complete(res);
          },
          checkUserName: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<bool>(
                function: () async => await  getUserAuthRepository.checkUserName(
                    userNameHash512: value.userNameHash512
                ),
            );
            userAuthData = userAuthData.copyWithData(
              error: error,
              e: e,
              timeOut: timeOut,
              statusAuthorization: false,
            );
            if (error){
              Logger.print('Error checkUserName.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res);
            }
          },
          checkPassword: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async => await  getUserAuthRepository.checkPassword(
                  userNameHash512: value.userNameHash512,
                  userPasswordHash512: value.userPasswordHash512
              ),
            );
            userAuthData = userAuthData.copyWithData(
              error: error,
              e: e,
              timeOut: timeOut,
              statusAuthorization: false,
            );
            if (error){
              Logger.print('Error setPassword.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              userAuthData = userAuthData.copyWithData(statusAuthorization: true);
              value.completer.complete(res);
            }
          },
          setUserName: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<bool>(
              function: () async => await setUserAuthRepository.setUserName(
                  userNameHash512: value.userNameHash512
              ),
            );
            userAuthData = userAuthData.copyWithData(
              error: error,
              e: e,
              timeOut: timeOut,
              statusAuthorization: false,
            );
            if (error){
              Logger.print('Error setUserName.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res);
            }
          },
          setPassword: (value) async {
            // final (error, timeOut, e, res) = await _runGoSData<bool>(
            //   function: () async => await  setUserAuthRepository.setPasswordAndUserGroup(
            //       userNameHash512: value.userNameHash512,
            //       userPasswordHash512: value.userPasswordHash512,
            //       eMail: value.eMail,
            //       userGroup: value.userGroup
            //   )
            // );
            // userAuthData = userAuthData.copyWithData(
            //   error: error,
            //   e: e,
            //   timeOut: timeOut,
            //   statusAuthorization: false,
            // );
            // if (error){
            //   Logger.print('Error setPassword.:$timeOut:$e', name: 'err', error: true);
            //   value.completer.completeError(error);
            // } else {
            //   userAuthData = userAuthData.copyWithData(statusAuthorization: true);
            //   value.completer.complete(res);
            // }
          },
      );
    });
  }

  Future<void> _response(Emitter<UserAuthState> emit) async {
    if (userAuthData.error){
      if(userAuthData.timeOut){
        emit(const UserAuthState.timeOut());
      } else {
        emit(const UserAuthState.error());
      }
    } else{
      final data = userAuthData.data;
      if (data != null) {
        userAuthData = userAuthData.copyWithData(
          eMail: data.eMail,
          statusAuthorization: data.statusAuthorization,
        );
        emit(const UserAuthState.loaded());
      } else {
        Logger.print('Data not loaded.', name: 'err', error: true);
        emit(const UserAuthState.newUser());
        userAuthData = const UserAuthData(
          timeOut: false,
          data: null,
          e: '',
          error: false,
        );
      }
    }
  }

  Future<(bool, bool, String, T?)> _runGoSData<T>({required Future<T?> Function() function}) async {
    var error = false;
    var timeOut = false;
    var e = '';
    T? res;
    try {
      //await Future.delayed(const Duration(seconds: 1));
      res = await function().timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut = true;
            e = 'TimeOut';
            return null;
          });
    } on Exception catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
      e = ee.toString();
    //ignore: avoid_catches_without_on_clauses
    } catch(ee, t){
      Logger.print('$ee\n$t', name: 'err', error: true);
      error = true;
      e = ee.toString();
    }
    return (error, timeOut, e, res);
  }
}
