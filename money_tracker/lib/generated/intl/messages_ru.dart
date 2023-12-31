// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(nameCategory) => "${nameCategory}";

  static String m1(monthName) => "За ${monthName} нет расходов";

  static String m2(dayExpense) => "Всего ${dayExpense}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addCategory":
            MessageLookupByLibrary.simpleMessage("Добавить категорию"),
        "addExpense": MessageLookupByLibrary.simpleMessage("Добавить расход"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт?"),
        "april": MessageLookupByLibrary.simpleMessage("Апрель"),
        "august": MessageLookupByLibrary.simpleMessage("Август"),
        "changeCategory":
            MessageLookupByLibrary.simpleMessage("Изменить категорию"),
        "changeExpense":
            MessageLookupByLibrary.simpleMessage("Изменить расход"),
        "close": MessageLookupByLibrary.simpleMessage("Закрыть"),
        "color": MessageLookupByLibrary.simpleMessage("Цвет"),
        "confirm": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "costAccounting": MessageLookupByLibrary.simpleMessage("Учёт расходов"),
        "dataLoaded": MessageLookupByLibrary.simpleMessage("Данные загружены"),
        "december": MessageLookupByLibrary.simpleMessage("Декабрь"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deleteConsumptionData":
            MessageLookupByLibrary.simpleMessage("Удалить данные о расходе?"),
        "deleteUserData": MessageLookupByLibrary.simpleMessage(
            "Удалить пользовательские данные!"),
        "editExpense": MessageLookupByLibrary.simpleMessage("Изменить расход"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailFormatIsNotCorrect":
            MessageLookupByLibrary.simpleMessage("Формат E-Mail не правильный"),
        "enterAmount": MessageLookupByLibrary.simpleMessage("Введите сумму"),
        "enterColor": MessageLookupByLibrary.simpleMessage("Введите цвет"),
        "enterDate": MessageLookupByLibrary.simpleMessage("Введите дату"),
        "enterEmail":
            MessageLookupByLibrary.simpleMessage("Введите свою почту"),
        "enterText": MessageLookupByLibrary.simpleMessage("Введите текст"),
        "enterTheName":
            MessageLookupByLibrary.simpleMessage("Введите название"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Введите свой пароль"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка!"),
        "errorLengthMustBe6SymbolsInHexFormat":
            MessageLookupByLibrary.simpleMessage(
                "Введите 6 символов в Hex формате"),
        "exit": MessageLookupByLibrary.simpleMessage("Выйти"),
        "expenses": MessageLookupByLibrary.simpleMessage("Расходы"),
        "february": MessageLookupByLibrary.simpleMessage("Февраль"),
        "fieldIsEmpty":
            MessageLookupByLibrary.simpleMessage("Поле не заполнено"),
        "friday": MessageLookupByLibrary.simpleMessage("Пт"),
        "january": MessageLookupByLibrary.simpleMessage("Январь"),
        "july": MessageLookupByLibrary.simpleMessage("Июль"),
        "june": MessageLookupByLibrary.simpleMessage("Июнь"),
        "march": MessageLookupByLibrary.simpleMessage("Март"),
        "may": MessageLookupByLibrary.simpleMessage("Май"),
        "modifi": MessageLookupByLibrary.simpleMessage("Изменить"),
        "monday": MessageLookupByLibrary.simpleMessage("Пн"),
        "name": MessageLookupByLibrary.simpleMessage("Название"),
        "name_category": m0,
        "noAccountYet":
            MessageLookupByLibrary.simpleMessage("Еще нет аккаунта?"),
        "noMoreThan20Categories":
            MessageLookupByLibrary.simpleMessage("Не более 20 категорий"),
        "notImplemented":
            MessageLookupByLibrary.simpleMessage("Не реализовано"),
        "november": MessageLookupByLibrary.simpleMessage("Ноябрь"),
        "october": MessageLookupByLibrary.simpleMessage("Октябрь"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "pageNotFound":
            MessageLookupByLibrary.simpleMessage("Страница не найдена"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile": MessageLookupByLibrary.simpleMessage("Профиль"),
        "registration": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "removeCategory":
            MessageLookupByLibrary.simpleMessage("Удалить категорию "),
        "repeat": MessageLookupByLibrary.simpleMessage("Повторить"),
        "replyReceived": MessageLookupByLibrary.simpleMessage("Ответ получен"),
        "saturday": MessageLookupByLibrary.simpleMessage("Сб"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Выберите дату"),
        "september": MessageLookupByLibrary.simpleMessage("Сентябрь"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
        "somethingWrongHappened":
            MessageLookupByLibrary.simpleMessage("Случилось что-то не то..."),
        "suchAUserExists": MessageLookupByLibrary.simpleMessage(
            "Такой пользователь существует"),
        "sunday": MessageLookupByLibrary.simpleMessage("Вс"),
        "theCategoryAlreadyExistsChangeTheDetails":
            MessageLookupByLibrary.simpleMessage("Такая катеория уже создана"),
        "thePasswordMustContainCapitalLetters":
            MessageLookupByLibrary.simpleMessage(
                "Пароль должен содержать заглавные буквы"),
        "thePasswordMustContainNumbers": MessageLookupByLibrary.simpleMessage(
            "Пароль должен содержать цифры"),
        "thePasswordMustContainOnlyLatinCharacters":
            MessageLookupByLibrary.simpleMessage(
                "Пароль должен соержать только латинские символы"),
        "thePasswordMustContainSpecialCharacters":
            MessageLookupByLibrary.simpleMessage(
                "Пароль должен содержать специальные символы"),
        "thePasswordMustNotContainSpaces": MessageLookupByLibrary.simpleMessage(
            "Пароль не должен содержать пробелов"),
        "theUsernameIsTakenOrDisabled": MessageLookupByLibrary.simpleMessage(
            "Имя пользователя занято или запрещено"),
        "thereAreNoExpensesForMonthName": m1,
        "thereShouldBeOnlyNumbers":
            MessageLookupByLibrary.simpleMessage("Должны быть только цифры"),
        "thisUserDoesNotExist": MessageLookupByLibrary.simpleMessage(
            "Такого пользователя не существует или ошибка в пароле"),
        "thursday": MessageLookupByLibrary.simpleMessage("Чт"),
        "timeout": MessageLookupByLibrary.simpleMessage("Таймаут"),
        "totalDayexpense": m2,
        "tuesday": MessageLookupByLibrary.simpleMessage("Вт"),
        "wednesday": MessageLookupByLibrary.simpleMessage("Ср"),
        "yourExpenseHistoryIsAlwaysAtHand":
            MessageLookupByLibrary.simpleMessage(
                "Ваша история расходов всегда под рукой")
      };
}
