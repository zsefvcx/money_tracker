

import 'package:flutter/foundation.dart';

class ValidatorFields {

  static String? checkStringIfEmpty(String? value){
    if(value == null || value.isEmpty) return 'Введите текст';
    return null;
  }

  static String? checkPasswordCompliant(String? value, [int minLength = 8]) {
    if (value == null || value.length < minLength) {
      return 'Длинна пароля меньше $minLength!';
    }
    if(RegExp('[A-Z]').hasMatch(value)){
      if(RegExp('[0-9]').hasMatch(value)){
        if(RegExp('[0-9]').hasMatch(value)){
          if(RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)){
            if (kDebugMode) {
              print(value.hashCode);
            }
            return null;
          } else {
            return 'Пароль должен соержать спецсимволы';
          }
        } else {
          return 'Пароль должен соержать прописные буквы';
        }
      } else {
        return 'Пароль должен соержать цифры';
      }
    } else {
      return 'Пароль должен соержать заглавные буквы';
    }
  }

  static String? checkEMail(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    if(value != null && value.length > 255){//255 это типо фича
      return 'Формат E-Mail не правильный';
    }
    if(value != null && !value.contains('@') && !value.contains('.')){
      return 'Формат E-Mail не правильный';
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? '')){
      return 'Формат E-Mail не правильный';
    }
    return null;
  }

  static String? checkAge(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Год не распознан';
    if (age < 18 || age > 110) return 'Год не правильный';
    return null;
  }

  static String? checkMonth(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Месяц не распознан';
    if (age < 0 || age > 12) return 'Месяц не правильный';
    return null;
  }

  static String? checkYear(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    final age = int.tryParse(value??'');
    if (age == null) return 'Год не рапознан';
    if (age < 0 || age > 99) return 'Год не правильный';
    return null;
  }

  static String? checkName(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
               //r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]'
    if(value != null && value.length > 255){
      return 'Формат фамилии/имени не правильный';
    }
    return null;
  }

  static String? checkLastName(String? value){
    if (value == null || value.isEmpty) return null;
    //r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]'
    if(value.length > 255){
      return 'Формат отчества не правильный';
    }
    return null;
  }

  static String? checkCreditCard(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    if(!RegExp(r'(^([0-9]{4}[- ]?){3}[0-9]{4}$)').hasMatch(value ?? '')){
      return 'Формат номера карты не правильный';
    }
    return null;
  }

  static String? checkPhone(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    if(!RegExp(r'(^[\+]?[0-9]{1,3}[-\s\.]?[(]?[0-9]{2,3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{2}[-\s\.]?[0-9]{2}$)').hasMatch(value ?? '')){
      return 'Формат телефонного номера не правильный';
    }
    return null;
  }

  static String? checkValidUrl(String? value){
    final res = checkStringIfEmpty(value);
    if (res != null) return res;
    ///Используем встроенный валидатор
    if(value != null){
      final uri = Uri.tryParse(value);
      if(uri != null) {
        if (!uri.hasAbsolutePath) {
          return 'Пожалуста введите правильный url';
        } else {
          return null;
        }
      }
    }
    return 'Please enter valid url';
    ///Используем регулярные выражения
    // String hasValidUrl(String value) {
    //   String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    //   RegExp regExp = new RegExp(pattern);
    //   if (value.length == 0) {
    //     return 'Please enter url';
    //   }
    //   else if (!regExp.hasMatch(value)) {
    //     return 'Please enter valid url';
    //   }
    //   return null;
    // }
  }
}
