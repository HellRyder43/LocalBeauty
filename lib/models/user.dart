class User {
  String username;
  String password;
  String email;
  String userType;

  User(
      {String usernameInit,
      String passwordInit,
      String emailInit,
      String userTypeInit}) {
    username = usernameInit;
    password = passwordInit;
    email = emailInit;
    userType = userTypeInit;
  }
}
