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

  /// `Welcome`
  String get welcomeMessage {
    return Intl.message(
      'Welcome',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInBtn {
    return Intl.message(
      'Sign in',
      name: 'signInBtn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpBtn {
    return Intl.message(
      'Sign up',
      name: 'signUpBtn',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailMissing {
    return Intl.message(
      'Email is required',
      name: 'emailMissing',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailHint {
    return Intl.message(
      'Email address',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailLabel {
    return Intl.message(
      'Email address',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Passwords should be at least 8 characters long, with one uppercase letter, one digit and one special character`
  String get passwordRequirement {
    return Intl.message(
      'Passwords should be at least 8 characters long, with one uppercase letter, one digit and one special character',
      name: 'passwordRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registering account, please wait...`
  String get registeringAccountMessage {
    return Intl.message(
      'Registering account, please wait...',
      name: 'registeringAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to register new user. Please try again`
  String get failedToSignUpMessage {
    return Intl.message(
      'Failed to register new user. Please try again',
      name: 'failedToSignUpMessage',
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
