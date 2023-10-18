import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_login_or_registration/src/core/hash.dart';
import 'package:package_login_or_registration/src/domain/bloc/user_auth_bloc.dart';

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
  bool _process = false;
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
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.import_contacts,
                    size: 150,
                  ),
                  10.h,
                  Text('Учет доходов',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: 'SF UI Display',
                        fontSize: 24,
                        height: 24/15,//When height is non-null, the line height of the span of text will be a multiple of fontSize and be exactly fontSize * height logical pixels tall.
                        fontWeight: FontWeight.bold
                      ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 180,
                    child: Text('Ваша история доходов всегда под рукой',
                      style: theme.textTheme.bodyLarge?.copyWith(
                          fontFamily: 'SF UI Display',
                          fontSize: 15,
                          height: 17/15,//When height is non-null, the line height of the span of text will be a multiple of fontSize and be exactly fontSize * height logical pixels tall.
                          fontWeight: FontWeight.normal
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  20.h,
                  TextFormField(
                    controller: _emailController,
                    mouseCursor: SystemMouseCursors.text,
                    validator: ValidatorFields.checkEMail,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Введите свою почту',
                    ),
                  ),
                  20.h,
                  TextFormField(
                    controller: _passwordController,
                    mouseCursor: SystemMouseCursors.text,
                    obscureText: _passwordVisible,
                    validator: _loginUser?ValidatorFields.checkPasswordCompliant:null,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: 'Пароль',
                      hintText: 'Введите свой пароль',
                      suffixIcon: IconButton(
                        icon: Icon(
                          !_passwordVisible
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
                  ElevatedButton(onPressed: () async {
                    final cSt = _formKey.currentState;
                    if(cSt != null && cSt.validate() && !_process) {
                      _process = true;
                      if (kDebugMode) {
                        _loginUser
                            ? print('New User Login')
                            : print('Login');
                      }
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
                                  'Такой пользователь существует', context
                              );
                            }
                            _process = false;
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
                              print('User Login in system...');
                            }
                          } else {
                            if (context.mounted) {
                              CustomShowSnackBar.showSnackBar(
                                  'Такого пользователя не существует или ошибка в пароле', context
                              );
                            }
                          }
                        } else {
                            if(!_loginUser) {
                              if (context.mounted) {
                                CustomShowSnackBar.showSnackBar(
                                    'Такого пользователя не существует или ошибка в пароле', context
                                );
                              }
                              _process = false;
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
                                  print('New User Login create...');
                                }
                              } else {
                                if (context.mounted) {
                                  CustomShowSnackBar.showSnackBar(
                                      'Имя пользователя занято или запрещено.', context
                                  );
                                }
                              }
                            } else {
                              if (context.mounted) {
                                CustomShowSnackBar.showSnackBar(
                                    'Имя пользователя занято или запрещено.', context
                                );
                              }
                            }
                        }

                      // } else {
                      //   blocBloc.add(UserAuthEvent.setUserName(
                      //       userNameHash512: hashUserName,
                      //       completer: completer)
                      //   );
                      //   final res = await completer.future;
                      //   if (res is bool && res) {
                      //     if (context.mounted) {
                      //       CustomShowSnackBar.showSnackBar(
                      //           'Имя пользователя свободно.', context
                      //       );
                      //     }
                      //   } else {
                      //     if (context.mounted) {
                      //       CustomShowSnackBar.showSnackBar(
                      //           'Имя пользователя занято или запрещено.', context
                      //       );
                      //     }
                      //   }
                      // }
                      _process = false;
                    }
                  }, child: _loginUser
                      ? const Text('Регистрация', style: TextStyle(color: Colors.white),)
                      : const Text('Войти', style: TextStyle(color: Colors.white),),
                  ),
                  20.h,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_loginUser) const Text('Уже есть аккаунт?') else const Text('Еще нет аккаунта?'),
                  TextButton(onPressed: (){
                    if (kDebugMode) {
                      print('Login');
                    }
                    setState(() {

                      _loginUser = !_loginUser;
                    });
                  }, child: _loginUser
                      ? const Text('Войти')
                      : const Text('Регистрация'),),
                ],
              ),
            ],
          )),
    );
  }
}