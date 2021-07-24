class User {
  String username;
  String password;
  String email;
  String userType;
  String location;
  String mobileNo;
  String image;

  User(
      {String usernameInit,
      String passwordInit,
      String emailInit,
      String userTypeInit,
      String locationInit,
      String mobileNoInit,
      String imageInit}) {
    username = usernameInit;
    password = passwordInit;
    email = emailInit;
    userType = userTypeInit;
    location = locationInit;
    mobileNo = mobileNoInit;
    image = imageInit;
  }
}
