import 'package:flutter/widgets.dart';

class FormValidator {
  static final addEditContactFormKey = GlobalKey<FormState>();

  static String? isRequired(String? value) {
    if (value == null) {
      return "Required";
    }
    if (value.isEmpty) {
      return "Required";
    }
    return null;
  }

  static String? isEmail(String? value) {
    if (value == null) {
      return "Required";
    }
    if (value.isEmpty) {
      return "Required";
    }
    if (!value.contains('@')) {
      return "Invalid email";
    }
    return null;
  }
}
