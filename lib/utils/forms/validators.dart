import 'package:intl/intl.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateRole(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter fill your role';
    }
    return null;
  }

  static String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your country';
    }
    return null;
  }

  static String? validateDescribe(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your description';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for email validation
    const emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre numéro de téléphone';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Le numéro de téléphone doit contenir uniquement des chiffres';
    }
    return null;
  }

  static String? validateEmptyPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birth date';
    }
    try {
      DateFormat('dd/MM/yyyy').parseStrict(value);
      return null;
    } catch (e) {
      return 'Invalid date';
    }
  }
}
