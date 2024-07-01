class Validators {
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First Name is required';
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'User Name is required';
    }
    return null;
  }

  String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Password is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must contain 1 Capital, Small, Digit, Special Character and length should be of 8';
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last Name is required';
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePhone(String value) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  String? validateHeight(String value) {
    if (value.trim().isEmpty) {
      return 'Please enter your height';
    } else {
      return null;
    }
  }

  String? validateWeight(String value) {
    if (value.trim().isEmpty) {
      return 'Please enter your weight';
    } else {
      return null;
    }
  }

  String? validateDateOfBirth(String value) {
    if (value.trim().isEmpty) {
      return 'Please select your DOB';
    } else {
      return null;
    }
  }

  String? validateGender(String value) {
    if (value.trim().isEmpty) {
      return 'Please select a gender';
    } else {
      return null;
    }
  }
}
