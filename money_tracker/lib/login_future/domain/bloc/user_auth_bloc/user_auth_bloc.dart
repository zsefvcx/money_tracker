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
part 'user_auth_data.dart';

//@injectable
class UserAuthBloc extends Bloc<UserAuthEvent, UserAuthState> {

  final GetUserAuthRepository getUserAuthRepository;
  final SetUserAuthRepository setUserAuthRepository;

  static int timeOutV = 10;

  UserAuthData userAuthData = const UserAuthData(
    timeOut: false,
    data: null,
    e: '',
    error: false,
  );

  UserAuthBloc({
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
            final completer =  value.completer;
            if(completer != null){
              if (error){
                Logger.print('Error init.:$timeOut:$e', name: 'err', error: true);
                completer.completeError(error);
              } else {
                completer.complete(res);
              }
            }
          },
          logout: (value) async {
            emit(const UserAuthState.loading());
            final (error, timeOut, e, res) = await _runGoSData<UserAuthorizationPasswordEntity>(
              function: () async => await setUserAuthRepository.logout(),
            );
            userAuthData = userAuthData.copyWithData(
              data: res,
              error: error,
              e: e,
              timeOut: timeOut,
              loadImage: false,
            );
            await _response(emit);
            if (error){
              Logger.print('Error logout.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res?.statusAuthorization);
            }
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
              loadImage: false,
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
            final (error, timeOut, e, res) = await _runGoSData<UserAuthorizationPasswordEntity>(
              function: () async => await  getUserAuthRepository.checkPassword(
                  userNameHash512: value.userNameHash512,
                  userPasswordHash512: value.userPasswordHash512
              ),
            );
            userAuthData = userAuthData.copyWithData(
              data: res,
              error: error,
              e: e,
              timeOut: timeOut,
            );
            await _response(emit);
            if (error){
              Logger.print('Error setPassword.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res?.statusAuthorization);
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
              loadImage: false,
            );
            if (error){
              Logger.print('Error setUserName.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res);
            }
          },
          setPassword: (value) async {
            final (error, timeOut, e, res) = await _runGoSData<UserAuthorizationPasswordEntity>(
              function: () async => await  setUserAuthRepository.setPasswordAndUserGroup(
                  userNameHash512: value.userNameHash512,
                  userPasswordHash512: value.userPasswordHash512,
                  eMail: value.eMail,
                  userGroup: value.userGroup
              ),
            );
            userAuthData = userAuthData.copyWithData(
              data: res,
              error: error,
              e: e,
              timeOut: timeOut,
            );
            await _response(emit);
            if (error){
              Logger.print('Error setPassword.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res?.statusAuthorization);
            }
          },
          delete: (value) async {
              emit(const UserAuthState.loading());
              final (error, timeOut, e, res) = await _runGoSData<bool>(
                function: () async => await  setUserAuthRepository.deleteUserData(),
              );
              userAuthData = userAuthData.copyWithData(
                error: error,
                e: e,
                timeOut: timeOut,
                statusAuthorization: false,
                loadImage: false,
              );
              await _response(emit);
              final completer =  value.completer;
              if(completer != null){
                if (error){
                  Logger.print('Error init.:$timeOut:$e', name: 'err', error: true);
                  completer.completeError(error);
                } else {
                  completer.complete(res);
                }
              }
          },
          changeLoadImageStatus: (value) async {
            emit(const UserAuthState.loading());
            final (error, timeOut, e, res) = await _runGoSData<UserAuthorizationPasswordEntity>(
              function: () async => await setUserAuthRepository.changeLoadImageStatus(status: value.status),
            );
            userAuthData = userAuthData.copyWithData(
              data: res,
              error: error,
              e: e,
              timeOut: timeOut,
            );
            await _response(emit);
            if (error){
              Logger.print('Error changeLoadImageStatus.:$timeOut:$e', name: 'err', error: true);
              value.completer.completeError(error);
            } else {
              value.completer.complete(res?.statusAuthorization);
            }
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
          uuid: data.uuid,
          eMail: data.eMail,
          statusAuthorization: data.statusAuthorization,
          loadImage: data.loadImage,
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
      await Future.delayed(const Duration(milliseconds: 50));
      res = await function().timeout(Duration(seconds: timeOutV),
          onTimeout: () {
            error = true;
            timeOut = true;
            e = 'TimeOut';
            return null;
          });
      Logger.print('res: $res', name: 'res');
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
