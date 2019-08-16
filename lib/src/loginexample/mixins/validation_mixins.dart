class ValidationMixin {
  String validateEmail(String email) {
    if (!email.contains('@')) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String validatePassword(password) {
    if (password.length < 4) {
      return 'Password must be atleast 4 characters';
    }
    return null;
  }
}
