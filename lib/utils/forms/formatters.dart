import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DateInputFormatter extends TextInputFormatter {
  static bool isValidDate(String input) {
    try {
      DateFormat('dd/MM/yyyy').parseStrict(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Filtrer les caractères: ne permettre que les chiffres et "/"
    String filtered = newValue.text.replaceAll(RegExp(r'[^0-9/]'), '');

    // Ajouter des séparateurs
    var dateText = _addSeperators(filtered, '/');

    return newValue.copyWith(
        text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeperators(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      if (i == 8) break;
      newString += value[i];
      if (i == 1 || i == 3) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
