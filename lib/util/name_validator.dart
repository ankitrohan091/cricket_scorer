class Validator {
  static bool isInvalidName(String name) {
    RegExp variableNameRegex = RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]*$');
    return !variableNameRegex.hasMatch(name);
  }
}
