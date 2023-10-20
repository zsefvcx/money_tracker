import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/core/hash.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';
import 'package:package_login_or_registration/src/presentation/widgets/main_splash_widget.dart';

import 'package:package_login_or_registration/src/src.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key, this.loginUser});

  final bool? loginUser;

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  bool _loginUser = false;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();


  @override
  void initState() {
    super.initState();
    _emailController.text = 'test@test.ru';
    _passwordController.text = 'dddDDDD4475.';
    if (widget.loginUser==null) {
      _loginUser = true;
    } else {
      _loginUser = false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blocBloc = context.read<GetUserAuthBloc>();
    final valueListenableProcess = ValueNotifier<bool>(false);
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Hero(tag: Keys.heroIdSplash,
                    child: MainSplashWidget()),
                TextFormField(
                  controller: _emailController,
                  mouseCursor: SystemMouseCursors.text,
                  validator: ValidatorFields.checkEMail,
                  decoration: InputDecoration(
                    labelText: 'E-mail'.hardcoded,
                    hintText: 'Введите свою почту'.hardcoded,
                  ),
                ),
                20.h,
                TextFormField(
                  controller: _passwordController,
                  mouseCursor: SystemMouseCursors.text,
                  obscureText: !_passwordVisible,
                  validator: _loginUser?ValidatorFields.checkPasswordCompliant:null,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    labelText: 'Пароль'.hardcoded,
                    hintText: 'Введите свой пароль'.hardcoded,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: theme.primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                40.h,
                GestureDetector(
                  onTap: ()=> loginUser(
                      blocBloc: blocBloc,
                      valueListenableProcess: valueListenableProcess,
                      context: context,
                  ),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: valueListenableProcess,
                    builder: (_, value, __) {
                        return Container(
                          width: CustomThemeProp.buttonSize.width,
                          height: CustomThemeProp.buttonSize.height,
                          decoration: BoxDecoration(
                            color: value?CustomThemeProp.grayLight:CustomThemeProp.violetFirm,
                            borderRadius: BorderRadius.all(Radius.circular(CustomThemeProp.buttonSize.height/2)),
                          ),
                          child: Center(
                            child: value? const CircularProgressIndicator(color: CustomThemeProp.violetFirm):
                                   _loginUser ? Text('Регистрация'.hardcoded, style: const TextStyle(color: Colors.white),)
                                   : Text('Войти'.hardcoded, style: const TextStyle(color: Colors.white),),
                          ));
                      },
                  ),
                ),
                20.h,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_loginUser) Text('Уже есть аккаунт?'.hardcoded) else Text('Еще нет аккаунта?'.hardcoded),
                TextButton(onPressed: (){
                  if (kDebugMode) {
                    print('Login');
                  }
                  setState(() {

                    _loginUser = !_loginUser;
                  });
                }, child: _loginUser
                    ? Text('Войти'.hardcoded)
                    : Text('Регистрация'.hardcoded),),
              ],
            ),
          ],
        ));
  }

  Future<void> loginUser({
    required GetUserAuthBloc blocBloc, 
    required ValueNotifier<bool> valueListenableProcess,
    required BuildContext context,
  }) async {
    final cSt = _formKey.currentState;
    if(cSt != null && cSt.validate() && !valueListenableProcess.value) {
      valueListenableProcess.value = true;
      if (kDebugMode) {
        _loginUser
            ? print('New User Login'.hardcoded)
            : print('Login'.hardcoded);
      }
      await Future.delayed(const Duration(seconds: 1));
      final completer = Completer();
      final completerFinal = Completer();
      final completerFinalSet = Completer();
      final hashUserName = Hash.hashSHA512(
          _emailController.text);
      final hashPassword = Hash.hashSHA512(
          _passwordController.text);
      blocBloc.add(UserAuthEvent.checkUserName(
          userNameHash512: hashUserName,
          completer: completer)
      );
      final res = await completer.future;
      if (res is bool && res) {
        if(_loginUser) {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                'Такой пользователь существует'.hardcoded, context
            );
          }
          valueListenableProcess.value = false;
          return;
        }
        ///Логинимся
        blocBloc.add(UserAuthEvent.checkPassword(
            userNameHash512: hashUserName,
            userPasswordHash512: hashPassword,
            completer: completerFinal)
        );
        final res = await completerFinal.future;
        if (res is bool && res) {
          if (kDebugMode) {
            print('User Login in system...'.hardcoded);
          }
          if (context.mounted){
            await Navigator.of(context).pushReplacementNamed(r'\PageExpenses',
              arguments: {
                 'newUser': false,
                 'statusAuthorization':blocBloc.userAuthData.statusAuthorization,
              },
            );
          }
        } else {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                'Такого пользователя не существует или ошибка в пароле'.hardcoded, context
            );
          }
        }
      } else {
        if(!_loginUser) {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                'Такого пользователя не существует или ошибка в пароле'.hardcoded, context
            );
          }
          valueListenableProcess.value = false;
          return;
        }
        ///Регистрируемся
        blocBloc.add(UserAuthEvent.setUserName(
            userNameHash512: hashUserName,
            completer: completerFinal)
        );
        final res = await completerFinal.future;
        if (res is bool && res) {
          blocBloc.add(UserAuthEvent.setPassword(
              userNameHash512: hashUserName,
              userPasswordHash512: hashPassword,
              userGroup: UserGroup.admin,
              completer: completerFinalSet)
          );
          final res = await completerFinalSet.future;
          if (res is bool && res) {
            if (kDebugMode) {
              print('New User Login create...'.hardcoded);
            }
            if (context.mounted){
              await Navigator.of(context).pushReplacementNamed(r'\PageExpenses',
                arguments: {
                  'newUser': true,
                  'statusAuthorization':blocBloc.userAuthData.statusAuthorization,
                },
              );
            }
          } else {
            if (context.mounted) {
              CustomShowSnackBar.showSnackBar(
                  'Имя пользователя занято или запрещено.'.hardcoded, context
              );
            }
          }
        } else {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                'Имя пользователя занято или запрещено.'.hardcoded, context
            );
          }
        }
      }
      valueListenableProcess.value = false;
    }
  }

}
