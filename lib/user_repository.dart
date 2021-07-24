import 'package:local_beauty/models/user.dart';

class UserRepository {
  List<User> allUsers = [
    User(
        usernameInit: "Auni",
        passwordInit: "123456",
        emailInit: "auni@gmail.com",
        userTypeInit: "Customer"),
    User(
        usernameInit: "Amir",
        passwordInit: "123456",
        emailInit: "amir@gmail.com",
        userTypeInit: "Admin"),
    User(
        usernameInit: "Sada",
        passwordInit: "123456",
        emailInit: "sada@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Kajang",
        mobileNoInit: "0112340293",
        imageInit: "sada.jpeg"),
    User(
        usernameInit: "Uwais",
        passwordInit: "123456",
        emailInit: "uwais@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Ampang",
        mobileNoInit: "0123924232",
        imageInit: "uwais.jpg")
  ];

  List<User> getMua() {
    List<User> muaUsers = allUsers.where((x) => x.userType == "Mua").toList();

    return muaUsers;
  }
}

class LoggedInUser {
  User loggedInUser = new User();
}
