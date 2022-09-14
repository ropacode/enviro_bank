// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(firstName, lastName, loanAmount) =>
      "Congratulations ${firstName} ${lastName}! Your loan for ${loanAmount} has been approved";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "absa": MessageLookupByLibrary.simpleMessage("ABSA"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "applicationApproved": m0,
        "applicationDenied": MessageLookupByLibrary.simpleMessage(
            "Sorry, your loan application has been declined this time"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "applyForLoan":
            MessageLookupByLibrary.simpleMessage("Apply for a loan"),
        "bankAccountNumber":
            MessageLookupByLibrary.simpleMessage("Bank account number"),
        "bankAccountNumberMissing": MessageLookupByLibrary.simpleMessage(
            "Please enter valid account number"),
        "bankMissing":
            MessageLookupByLibrary.simpleMessage("Please elect a bank"),
        "capitec": MessageLookupByLibrary.simpleMessage("Capitec"),
        "collectionDate":
            MessageLookupByLibrary.simpleMessage("Debit order date"),
        "emailHint": MessageLookupByLibrary.simpleMessage("Email address"),
        "emailLabel": MessageLookupByLibrary.simpleMessage("Email address"),
        "emailMissing":
            MessageLookupByLibrary.simpleMessage("Email is required"),
        "failedToSignInMessage": MessageLookupByLibrary.simpleMessage(
            "Sign in failed. Please try again"),
        "failedToSignUpMessage": MessageLookupByLibrary.simpleMessage(
            "Failed to register new user. Please try again"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "firstNameMissing": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid first name"),
        "fnb": MessageLookupByLibrary.simpleMessage("FNB"),
        "homeTitle": MessageLookupByLibrary.simpleMessage("Home"),
        "idNumber": MessageLookupByLibrary.simpleMessage("ID number"),
        "idNumberMissing": MessageLookupByLibrary.simpleMessage(
            "Please enter valid ID number"),
        "investec": MessageLookupByLibrary.simpleMessage("Investec Limited"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lastNameMissing": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid last name"),
        "loanAmount": MessageLookupByLibrary.simpleMessage("Loan amount"),
        "loanAmountMissing": MessageLookupByLibrary.simpleMessage(
            "Please enter valid loan amount"),
        "loanApplication":
            MessageLookupByLibrary.simpleMessage("Loan application form"),
        "missingData": MessageLookupByLibrary.simpleMessage(
            "Your application is missing required fields. Please make sure you provide all required data"),
        "nedbank": MessageLookupByLibrary.simpleMessage("Nedbank Limited"),
        "noHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "okBtn": MessageLookupByLibrary.simpleMessage("OK"),
        "passwordHint": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordMissing":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "passwordRequirement": MessageLookupByLibrary.simpleMessage(
            "Passwords should be at least 8 characters long, with one uppercase letter, one digit and one special character"),
        "pickCollectionDate":
            MessageLookupByLibrary.simpleMessage("Select debit order date"),
        "registeringAccountMessage": MessageLookupByLibrary.simpleMessage(
            "Registering account, please wait..."),
        "selectBank": MessageLookupByLibrary.simpleMessage("Select bank"),
        "signInBtn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "signOutBtn": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signUpBtn": MessageLookupByLibrary.simpleMessage("Sign up"),
        "signingInMessage":
            MessageLookupByLibrary.simpleMessage("Signing in, please wait..."),
        "standardBank": MessageLookupByLibrary.simpleMessage("Standard Bank"),
        "submittingApplicationMessage": MessageLookupByLibrary.simpleMessage(
            "Submitting application, please wait..."),
        "vbs": MessageLookupByLibrary.simpleMessage("VBS"),
        "vbsWarning": MessageLookupByLibrary.simpleMessage(
            "Warning: refer to compliance"),
        "welcomeMessage": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
