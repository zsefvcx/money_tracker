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

  static String m0(nameCategory) => "${nameCategory}";

  static String m1(monthName) => "There are no expenses for ${monthName}";

  static String m2(dayExpense) => "total ${dayExpense}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addCategory": MessageLookupByLibrary.simpleMessage("Add category"),
        "addExpense": MessageLookupByLibrary.simpleMessage("Add expense"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "april": MessageLookupByLibrary.simpleMessage("April"),
        "august": MessageLookupByLibrary.simpleMessage("August"),
        "changeCategory":
            MessageLookupByLibrary.simpleMessage("Change category"),
        "changeExpense": MessageLookupByLibrary.simpleMessage("Change expense"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "color": MessageLookupByLibrary.simpleMessage("Color"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "costAccounting":
            MessageLookupByLibrary.simpleMessage("Cost accounting"),
        "dataLoaded": MessageLookupByLibrary.simpleMessage("Data loaded"),
        "december": MessageLookupByLibrary.simpleMessage("December"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteConsumptionData":
            MessageLookupByLibrary.simpleMessage("Delete consumption data?"),
        "deleteUserData":
            MessageLookupByLibrary.simpleMessage("Delete user data!"),
        "editExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailFormatIsNotCorrect": MessageLookupByLibrary.simpleMessage(
            "E-Mail format is not correct"),
        "enterAmount": MessageLookupByLibrary.simpleMessage("Enter amount"),
        "enterColor": MessageLookupByLibrary.simpleMessage("Enter color"),
        "enterDate": MessageLookupByLibrary.simpleMessage("Enter date"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter your email"),
        "enterText": MessageLookupByLibrary.simpleMessage("Enter text"),
        "enterTheName": MessageLookupByLibrary.simpleMessage("Enter name"),
        "enterYourPassword":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "error": MessageLookupByLibrary.simpleMessage("Error!"),
        "errorLengthMustBe6SymbolsInHexFormat":
            MessageLookupByLibrary.simpleMessage(
                "Enter 6 symbols in Hex format"),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
        "february": MessageLookupByLibrary.simpleMessage("February"),
        "fieldIsEmpty": MessageLookupByLibrary.simpleMessage("field is empty"),
        "friday": MessageLookupByLibrary.simpleMessage("Fr"),
        "january": MessageLookupByLibrary.simpleMessage("January"),
        "july": MessageLookupByLibrary.simpleMessage("July"),
        "june": MessageLookupByLibrary.simpleMessage("June"),
        "march": MessageLookupByLibrary.simpleMessage("March"),
        "may": MessageLookupByLibrary.simpleMessage("May"),
        "modifi": MessageLookupByLibrary.simpleMessage("Modifi"),
        "monday": MessageLookupByLibrary.simpleMessage("Mo"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "name_category": m0,
        "noAccountYet": MessageLookupByLibrary.simpleMessage("No account yet?"),
        "noMoreThan20Categories":
            MessageLookupByLibrary.simpleMessage("No more than 20 categories"),
        "notImplemented":
            MessageLookupByLibrary.simpleMessage("Not implemented"),
        "november": MessageLookupByLibrary.simpleMessage("November"),
        "october": MessageLookupByLibrary.simpleMessage("October"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "pageNotFound": MessageLookupByLibrary.simpleMessage("Page not found"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "registration": MessageLookupByLibrary.simpleMessage("Registration"),
        "removeCategory":
            MessageLookupByLibrary.simpleMessage("Remove category "),
        "repeat": MessageLookupByLibrary.simpleMessage("Repeat"),
        "replyReceived": MessageLookupByLibrary.simpleMessage("Reply received"),
        "saturday": MessageLookupByLibrary.simpleMessage("Sa"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
        "september": MessageLookupByLibrary.simpleMessage("September"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "somethingWrongHappened":
            MessageLookupByLibrary.simpleMessage("Something wrong happened..."),
        "suchAUserExists":
            MessageLookupByLibrary.simpleMessage("Such a user exists"),
        "sunday": MessageLookupByLibrary.simpleMessage("Su"),
        "theCategoryAlreadyExistsChangeTheDetails":
            MessageLookupByLibrary.simpleMessage("The category already exists"),
        "thePasswordMustContainCapitalLetters":
            MessageLookupByLibrary.simpleMessage(
                "The password must contain capital letters"),
        "thePasswordMustContainNumbers": MessageLookupByLibrary.simpleMessage(
            "The password must contain numbers"),
        "thePasswordMustContainOnlyLatinCharacters":
            MessageLookupByLibrary.simpleMessage(
                "The password must contain only Latin characters"),
        "thePasswordMustContainSpecialCharacters":
            MessageLookupByLibrary.simpleMessage(
                "The password must contain special characters"),
        "thePasswordMustNotContainSpaces": MessageLookupByLibrary.simpleMessage(
            "The password must not contain spaces"),
        "theUsernameIsTakenOrDisabled": MessageLookupByLibrary.simpleMessage(
            "The username is taken or disabled"),
        "thereAreNoExpensesForMonthName": m1,
        "thereShouldBeOnlyNumbers": MessageLookupByLibrary.simpleMessage(
            "There should be only numbers"),
        "thisUserDoesNotExist": MessageLookupByLibrary.simpleMessage(
            "This user does not exist or there is an error in the password"),
        "thursday": MessageLookupByLibrary.simpleMessage("Th"),
        "timeout": MessageLookupByLibrary.simpleMessage("TimeOut"),
        "totalDayexpense": m2,
        "tuesday": MessageLookupByLibrary.simpleMessage("Tu"),
        "wednesday": MessageLookupByLibrary.simpleMessage("We"),
        "yourExpenseHistoryIsAlwaysAtHand":
            MessageLookupByLibrary.simpleMessage(
                "Your expense history is always at hand")
      };
}
