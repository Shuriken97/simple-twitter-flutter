class Validators {
  /// If the value is null or empty, return an error message
  ///
  /// Args:
  ///   value (String): The value to be validated.
  ///   fieldName (String): The name of the field that is being validated.
  ///
  /// Returns:
  ///   A String?
  static String? validateEmptyString(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      if (fieldName != null) {
        return '$fieldName is required';
      }
      return 'Field is required';
    }

    return null;
  }

  /// If the value is null or empty, return an error message. If the value is not null or empty, check if
  /// it matches the email pattern. If it doesn't match the email pattern, return an error message. If it
  /// does match the email pattern, return null
  ///
  /// Args:
  ///   val (String): The value to be validated.
  ///
  /// Returns:
  ///   A string that is either null or a string that contains an error message.
  static String? email(String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    // ignore: unnecessary_string_escapes
    const String pattern = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';

    final RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(val)) {
      return 'Email format incorrect';
    }

    return null;
  }
}
