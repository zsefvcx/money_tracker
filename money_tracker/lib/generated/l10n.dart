// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get february {
    return Intl.message(
      'February',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get march {
    return Intl.message(
      'March',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get april {
    return Intl.message(
      'April',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get july {
    return Intl.message(
      'July',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get august {
    return Intl.message(
      'August',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get november {
    return Intl.message(
      'November',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get december {
    return Intl.message(
      'December',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cost accounting`
  String get costAccounting {
    return Intl.message(
      'Cost accounting',
      name: 'costAccounting',
      desc: '',
      args: [],
    );
  }

  /// `Your expense history is always at hand`
  String get yourExpenseHistoryIsAlwaysAtHand {
    return Intl.message(
      'Your expense history is always at hand',
      name: 'yourExpenseHistoryIsAlwaysAtHand',
      desc: '',
      args: [],
    );
  }

  /// `Error!`
  String get error {
    return Intl.message(
      'Error!',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `TimeOut`
  String get timeout {
    return Intl.message(
      'TimeOut',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Reply received`
  String get replyReceived {
    return Intl.message(
      'Reply received',
      name: 'replyReceived',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get repeat {
    return Intl.message(
      'Repeat',
      name: 'repeat',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong happened...`
  String get somethingWrongHappened {
    return Intl.message(
      'Something wrong happened...',
      name: 'somethingWrongHappened',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration {
    return Intl.message(
      'Registration',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `No account yet?`
  String get noAccountYet {
    return Intl.message(
      'No account yet?',
      name: 'noAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `The username is taken or disabled`
  String get theUsernameIsTakenOrDisabled {
    return Intl.message(
      'The username is taken or disabled',
      name: 'theUsernameIsTakenOrDisabled',
      desc: '',
      args: [],
    );
  }

  /// `This user does not exist or there is an error in the password`
  String get thisUserDoesNotExist {
    return Intl.message(
      'This user does not exist or there is an error in the password',
      name: 'thisUserDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Such a user exists`
  String get suchAUserExists {
    return Intl.message(
      'Such a user exists',
      name: 'suchAUserExists',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Enter text`
  String get enterText {
    return Intl.message(
      'Enter text',
      name: 'enterText',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain special characters`
  String get thePasswordMustContainSpecialCharacters {
    return Intl.message(
      'The password must contain special characters',
      name: 'thePasswordMustContainSpecialCharacters',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain capital letters`
  String get thePasswordMustContainCapitalLetters {
    return Intl.message(
      'The password must contain capital letters',
      name: 'thePasswordMustContainCapitalLetters',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain numbers`
  String get thePasswordMustContainNumbers {
    return Intl.message(
      'The password must contain numbers',
      name: 'thePasswordMustContainNumbers',
      desc: '',
      args: [],
    );
  }

  /// `The password must not contain spaces`
  String get thePasswordMustNotContainSpaces {
    return Intl.message(
      'The password must not contain spaces',
      name: 'thePasswordMustNotContainSpaces',
      desc: '',
      args: [],
    );
  }

  /// `The password must contain only Latin characters`
  String get thePasswordMustContainOnlyLatinCharacters {
    return Intl.message(
      'The password must contain only Latin characters',
      name: 'thePasswordMustContainOnlyLatinCharacters',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail format is not correct`
  String get emailFormatIsNotCorrect {
    return Intl.message(
      'E-Mail format is not correct',
      name: 'emailFormatIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get expenses {
    return Intl.message(
      'Expenses',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Delete user data!`
  String get deleteUserData {
    return Intl.message(
      'Delete user data!',
      name: 'deleteUserData',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get addCategory {
    return Intl.message(
      'Add category',
      name: 'addCategory',
      desc: '',
      args: [],
    );
  }

  /// `Enter 6 symbols in Hex format`
  String get errorLengthMustBe6SymbolsInHexFormat {
    return Intl.message(
      'Enter 6 symbols in Hex format',
      name: 'errorLengthMustBe6SymbolsInHexFormat',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `field is empty`
  String get fieldIsEmpty {
    return Intl.message(
      'field is empty',
      name: 'fieldIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enterTheName {
    return Intl.message(
      'Enter name',
      name: 'enterTheName',
      desc: '',
      args: [],
    );
  }

  /// `Enter color`
  String get enterColor {
    return Intl.message(
      'Enter color',
      name: 'enterColor',
      desc: '',
      args: [],
    );
  }

  /// `There are no expenses for {monthName}`
  String thereAreNoExpensesForMonthName(Object monthName) {
    return Intl.message(
      'There are no expenses for $monthName',
      name: 'thereAreNoExpensesForMonthName',
      desc: '',
      args: [monthName],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Data loaded`
  String get dataLoaded {
    return Intl.message(
      'Data loaded',
      name: 'dataLoaded',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
