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
        userTypeInit: "Admin")
  ];
}

class LoggedInUser {
  User loggedInUser = new User();
}
