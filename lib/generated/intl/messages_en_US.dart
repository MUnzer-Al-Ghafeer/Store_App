// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  static String m0(servingSize) => "*Based on ${servingSize} fl. oz serving.";

  static String m1(quantity, formattedNumber) =>
      "${Intl.plural(quantity, one: 'One serving.', other: '${formattedNumber} servings in your system at one time.')}";

  static String m2(quantity, formattedNumber) =>
      "${Intl.plural(quantity, one: 'One serving per day.', other: '${formattedNumber} servings per day.')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "firstSuggestedDrinkName":
            MessageLookupByLibrary.simpleMessage("Drip Coffee (Cup)"),
        "formPageActionButtonTitle":
            MessageLookupByLibrary.simpleMessage("CALCULATE"),
        "formPageAppBarTitle": MessageLookupByLibrary.simpleMessage(
            "Death by Caffeine Calculator"),
        "formPageCustomDrinkCaffeineAmountInputLabel":
            MessageLookupByLibrary.simpleMessage("Caffeine"),
        "formPageCustomDrinkCaffeineAmountInputSuffix":
            MessageLookupByLibrary.simpleMessage("mg"),
        "formPageCustomDrinkRadioTitle":
            MessageLookupByLibrary.simpleMessage("Other"),
        "formPageCustomDrinkServingSizeInputLabel":
            MessageLookupByLibrary.simpleMessage("Serving Size"),
        "formPageCustomDrinkServingSizeInputSuffix":
            MessageLookupByLibrary.simpleMessage("fl. oz"),
        "formPageRadioListLabel":
            MessageLookupByLibrary.simpleMessage("Choose a drink"),
        "formPageWeightInputLabel":
            MessageLookupByLibrary.simpleMessage("Body Weight"),
        "formPageWeightInputSuffix":
            MessageLookupByLibrary.simpleMessage("pounds"),
        "resultsPageAppBarTitle":
            MessageLookupByLibrary.simpleMessage("Dosages"),
        "resultsPageFirstDisclaimer": m0,
        "resultsPageLethalDosageMessage": m1,
        "resultsPageLethalDosageTitle":
            MessageLookupByLibrary.simpleMessage("Lethal Dosage"),
        "resultsPageSafeDosageMessage": m2,
        "resultsPageSafeDosageTitle":
            MessageLookupByLibrary.simpleMessage("Daily Safe Maximum"),
        "resultsPageSecondDisclaimer": MessageLookupByLibrary.simpleMessage(
            "*Applies to age 18 and over. This calculator does not replace professional medical advice."),
        "secondSuggestedDrinkName":
            MessageLookupByLibrary.simpleMessage("Espresso (Shot)"),
        "thirdSuggestedDrinkName":
            MessageLookupByLibrary.simpleMessage("Latte (Mug)")
      };
}
