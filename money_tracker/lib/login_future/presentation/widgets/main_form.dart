import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:money_tracker/login_future/presentation/presentation.dart';

class MainForm extends StatefulWidget {
  const MainForm({required this.loginUserAuth, super.key});

  final bool? loginUserAuth;

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodeSecond = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.text = 'test@test.ru';
    _passwordController.text = 'dddDDDD4475.';
    if(widget.loginUserAuth??true){
      Timer.run(() {
        Navigator.of(context).pushReplacementNamed(r'\PageMoneyTracker',
          arguments: {
            'loginUser': true,
          }
        );
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    _focusNodeSecond.dispose();
    _focusNodeThree.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blocBloc = context.read<GetUserAuthBloc>();
    final valueListenableProcess = ValueNotifier<bool>(false);

    final valueLoginProcess = ValueNotifier<bool>(false);
    FocusScope.of(context).requestFocus();
    return widget.loginUserAuth??true
        ?const Center(child: CircularProgressIndicator(),)
        :Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Hero(tag: Keys.heroIdSplash,
                      child: MainSplash()),
                  CustomTextFormField(
                    autofocus: true,
                    focusNode: _focusNode,
                    nextFocusNode: _focusNodeSecond,
                    controller: _emailController,
                    labelText: S.of(context).email,
                    hintText: S.of(context).enterEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => ValidatorFields.checkEMail(value, context),
                  ),
                  20.h,
                  CustomTextFormField(
                    focusNode: _focusNodeSecond,
                    nextFocusNode: _focusNodeThree,
                    controller: _passwordController,
                    obscureText: true,
                    labelText: S.of(context).password,
                    hintText: S.of(context).enterYourPassword,
                    validator: (value) => ValidatorFields.checkPasswordCompliant(value, context),
                  ),
                  40.h,
                  CustomButton(
                    focusNode: _focusNodeThree,
                    onTap: ()=> loginUser(
                      blocBloc: blocBloc,
                      valueListenableProcess: valueListenableProcess,
                      context: context,
                    ),
                    child:
                    ValueListenableBuilder<bool>(
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
                            ValueListenableBuilder<bool>(
                              valueListenable: valueLoginProcess,
                              builder: (_, value, __) {
                                return Text(
                                  value?(S.of(context).registration):(S.of(context).signIn),
                                  style: theme.textTheme.titleSmall,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  20.h,
                ],
              ),
              ValueListenableBuilder<bool>(
              valueListenable: valueLoginProcess,
              builder: (_, value, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value
                      ? S.of(context).alreadyHaveAnAccount
                      : S.of(context).noAccountYet,
                      style: theme.textTheme.titleMedium
                    ),
                    TextButton(
                      onPressed: (){
                        valueLoginProcess.value = !valueLoginProcess.value;
                      },
                      child: value
                       ? Text(S.of(context).signIn, style: theme.textTheme.bodyLarge,)
                       : Text(S.of(context).registration, style: theme.textTheme.bodyLarge,),
                    ),
                  ],
                );},
              ),
            ],
    ),
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

        // if(!widget.loginUserAuth) {
        //   if (context.mounted) {
        //     CustomShowSnackBar.showSnackBar(
        //        S.of(context).suchAUserExists, context
        //     );
        //   }
        //   valueListenableProcess.value = false;
        //   return;
        // }
        ///Логинимся
        blocBloc.add(UserAuthEvent.checkPassword(
            userNameHash512: hashUserName,
            userPasswordHash512: hashPassword,
            completer: completerFinal)
        );
        final res = await completerFinal.future;
        if (res is bool && res) {
          if (context.mounted){
            await Navigator.of(context).pushReplacementNamed(r'\PageMoneyTracker',
              arguments: {
                 'loginUser': blocBloc.userAuthData.statusAuthorization,
              },
            );
          }
        } else {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                S.of(context).thisUserDoesNotExist, context
            );
          }
        }
      } else {
        // if(widget.loginUserAuth) {
        //   if (context.mounted) {
        //     CustomShowSnackBar.showSnackBar(
        //         S.of(context).thisUserDoesNotExist, context
        //     );
        //   }
        //   valueListenableProcess.value = false;
        //   return;
        // }
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
              eMail: _emailController.text,
              userGroup: UserGroup.admin,
              completer: completerFinalSet)
          );
          final res = await completerFinalSet.future;
          if (res is bool && res) {
            if (context.mounted){
              await Navigator.of(context).pushReplacementNamed(r'\PageMoneyTracker',
                arguments: {
                  'loginUser':blocBloc.userAuthData.statusAuthorization,
                },
              );
            }
          } else {
            if (context.mounted) {
              CustomShowSnackBar.showSnackBar(
                  S.of(context).theUsernameIsTakenOrDisabled, context
              );
            }
          }
        } else {
          if (context.mounted) {
            CustomShowSnackBar.showSnackBar(
                S.of(context).theUsernameIsTakenOrDisabled, context
            );
          }
        }
      }
      valueListenableProcess.value = false;
    }
  }
}
