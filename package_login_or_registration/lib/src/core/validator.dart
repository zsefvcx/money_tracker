
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:package_login_or_registration/generated/l10n.dart';

class ValidatorFields {

  static String? checkStringIfEmpty(String? value, BuildContext context){
    if(value == null || value.isEmpty) return S.of(context).enterText;
    return null;
  }

  static String? checkPasswordCompliant(String? value, BuildContext context, [int minLength = 8]) {
    if (value == null || value.length < minLength) {
      return 'Длинна пароля меньше $minLength или пароль пустой';
    }
    if(!RegExp('[ ]').hasMatch(value)) {
      if (!RegExp('[а-яА-Я]').hasMatch(value)) {//Еще надо добавить кучу символов относящихся к другим не латинским симвоам, но пусть будет так
        if (RegExp('[A-Z]').hasMatch(value)) {
          if (RegExp('[0-9]').hasMatch(value)) {
              if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                if (kDebugMode) {
                  print(value.hashCode);
                }
                return null;
              } else {
                return S.of(context).thePasswordMustContainSpecialCharacters;
              }
          } else {
            return S.of(context).thePasswordMustContainNumbers;
          }
        } else {
          return S.of(context).thePasswordMustContainCapitalLetters;
        }
      } else {
        return S.of(context).thePasswordMustContainOnlyLatinCharacters;
      }
    } else {
      return S.of(context).thePasswordMustNotContainSpaces;
    }
  }

  static String? checkEMail(String? value, BuildContext context){
    final res = checkStringIfEmpty(value, context);
    if (res != null) return res;
    if(value != null && value.length > 255){//255 это типо фича
      return S.of(context).emailFormatIsNotCorrect;
    }
    if(value != null && !value.contains('@') && !value.contains('.')){
      return S.of(context).emailFormatIsNotCorrect;
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? '')){
      return S.of(context).emailFormatIsNotCorrect;
    }
    return null;
  }

}
