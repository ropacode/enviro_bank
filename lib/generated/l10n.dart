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

  /// `Sign out`
  String get signOutBtn {
    return Intl.message(
      'Sign out',
      name: 'signOutBtn',
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

  /// `Password is required`
  String get passwordMissing {
    return Intl.message(
      'Password is required',
      name: 'passwordMissing',
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

  /// `Don't have an account?`
  String get noHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noHaveAccount',
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

  /// `Signing in, please wait...`
  String get signingInMessage {
    return Intl.message(
      'Signing in, please wait...',
      name: 'signingInMessage',
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

  /// `Sign in failed. Please try again`
  String get failedToSignInMessage {
    return Intl.message(
      'Sign in failed. Please try again',
      name: 'failedToSignInMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Apply for a loan`
  String get applyForLoan {
    return Intl.message(
      'Apply for a loan',
      name: 'applyForLoan',
      desc: '',
      args: [],
    );
  }

  /// `Loan application form`
  String get loanApplication {
    return Intl.message(
      'Loan application form',
      name: 'loanApplication',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid first name`
  String get firstNameMissing {
    return Intl.message(
      'Please enter a valid first name',
      name: 'firstNameMissing',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid last name`
  String get lastNameMissing {
    return Intl.message(
      'Please enter a valid last name',
      name: 'lastNameMissing',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get idNumber {
    return Intl.message(
      'ID number',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid ID number`
  String get idNumberMissing {
    return Intl.message(
      'Please enter valid ID number',
      name: 'idNumberMissing',
      desc: '',
      args: [],
    );
  }

  /// `Bank account number`
  String get bankAccountNumber {
    return Intl.message(
      'Bank account number',
      name: 'bankAccountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid account number`
  String get bankAccountNumberMissing {
    return Intl.message(
      'Please enter valid account number',
      name: 'bankAccountNumberMissing',
      desc: '',
      args: [],
    );
  }

  /// `Loan amount`
  String get loanAmount {
    return Intl.message(
      'Loan amount',
      name: 'loanAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid loan amount`
  String get loanAmountMissing {
    return Intl.message(
      'Please enter valid loan amount',
      name: 'loanAmountMissing',
      desc: '',
      args: [],
    );
  }

  /// `Select bank`
  String get selectBank {
    return Intl.message(
      'Select bank',
      name: 'selectBank',
      desc: '',
      args: [],
    );
  }

  /// `Please elect a bank`
  String get bankMissing {
    return Intl.message(
      'Please elect a bank',
      name: 'bankMissing',
      desc: '',
      args: [],
    );
  }

  /// `ABSA`
  String get absa {
    return Intl.message(
      'ABSA',
      name: 'absa',
      desc: '',
      args: [],
    );
  }

  /// `Capitec`
  String get capitec {
    return Intl.message(
      'Capitec',
      name: 'capitec',
      desc: '',
      args: [],
    );
  }

  /// `FNB`
  String get fnb {
    return Intl.message(
      'FNB',
      name: 'fnb',
      desc: '',
      args: [],
    );
  }

  /// `Investec Limited`
  String get investec {
    return Intl.message(
      'Investec Limited',
      name: 'investec',
      desc: '',
      args: [],
    );
  }

  /// `Nedbank Limited`
  String get nedbank {
    return Intl.message(
      'Nedbank Limited',
      name: 'nedbank',
      desc: '',
      args: [],
    );
  }

  /// `Standard Bank`
  String get standardBank {
    return Intl.message(
      'Standard Bank',
      name: 'standardBank',
      desc: '',
      args: [],
    );
  }

  /// `VBS`
  String get vbs {
    return Intl.message(
      'VBS',
      name: 'vbs',
      desc: '',
      args: [],
    );
  }

  /// `Warning: refer to compliance`
  String get vbsWarning {
    return Intl.message(
      'Warning: refer to compliance',
      name: 'vbsWarning',
      desc: '',
      args: [],
    );
  }

  /// `Select debit order date`
  String get pickCollectionDate {
    return Intl.message(
      'Select debit order date',
      name: 'pickCollectionDate',
      desc: '',
      args: [],
    );
  }

  /// `Debit order date`
  String get collectionDate {
    return Intl.message(
      'Debit order date',
      name: 'collectionDate',
      desc: '',
      args: [],
    );
  }

  /// `Submitting application, please wait...`
  String get submittingApplicationMessage {
    return Intl.message(
      'Submitting application, please wait...',
      name: 'submittingApplicationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, your loan application has been declined this time`
  String get applicationDenied {
    return Intl.message(
      'Sorry, your loan application has been declined this time',
      name: 'applicationDenied',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations {firstName} {lastName}! Your loan for {loanAmount} has been approved`
  String applicationApproved(
      Object firstName, Object lastName, Object loanAmount) {
    return Intl.message(
      'Congratulations $firstName $lastName! Your loan for $loanAmount has been approved',
      name: 'applicationApproved',
      desc: '',
      args: [firstName, lastName, loanAmount],
    );
  }

  /// `Your application is missing required fields. Please make sure you provide all required data`
  String get missingData {
    return Intl.message(
      'Your application is missing required fields. Please make sure you provide all required data',
      name: 'missingData',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get okBtn {
    return Intl.message(
      'OK',
      name: 'okBtn',
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
