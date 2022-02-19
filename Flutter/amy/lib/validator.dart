class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    // Add this post testing
    RegExp snuMail =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@snu+\.+edu+\.+in$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!snuMail.hasMatch(email)) {
      return 'Enter a correct snu email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validateMessID({required String? messID}) {
    if (messID == null) {
      return null;
    }

    // Add this post testing
    RegExp regmessID = RegExp(r"^[0-9]{6,6}$");

    if (messID.isEmpty) {
      return 'Mess ID can\'t be empty';
    } else if (!regmessID.hasMatch(messID)) {
      return 'Enter a correct mess ID';
    }

    return null;
  }

  static String? validatePhoneNumber({required String? phone}) {
    if (phone == null) {
      return null;
    }

    // Add this post testing
    RegExp regmessID = RegExp(r"^[0-9]{10,10}$");

    if (phone.isEmpty) {
      return 'Phone Number can\'t be empty';
    } else if (!regmessID.hasMatch(phone)) {
      return 'Enter a valid 10 digit Phone Number';
    }

    return null;
  }
}
