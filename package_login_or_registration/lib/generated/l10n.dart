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
