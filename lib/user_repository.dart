import 'package:local_beauty/models/user.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  factory UserRepository() {
    return _instance;
  }

  User signedIn = new User();

  List<User> allUsers = [
    User(
        usernameInit: "Auni",
        passwordInit: "123456",
        emailInit: "auni@gmail.com",
        userTypeInit: "Customer",
        imageInit: "auni.jpeg"),
    User(
        usernameInit: "Amir",
        passwordInit: "123456",
        emailInit: "amir@gmail.com",
        userTypeInit: "Admin",
        imageInit: "amir.jpeg"),
    User(
        usernameInit: "Aida",
        passwordInit: "123456",
        emailInit: "aida@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Kajang",
        mobileNoInit: "0112340293",
        imageInit: "Aida.jpeg"),
    User(
        usernameInit: "Anis",
        passwordInit: "123456",
        emailInit: "anis@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Ampang",
        mobileNoInit: "0123924232",
        imageInit: "Anis.jpeg"),
    User(
        usernameInit: "Mia Muna",
        passwordInit: "123456",
        emailInit: "mia@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Gombak",
        mobileNoInit: "0112340293",
        imageInit: "mia.jpeg"),
    User(
        usernameInit: "Sakinah",
        passwordInit: "123456",
        emailInit: "sakinah@gmail.com",
        userTypeInit: "Mua",
        locationInit: "Cheras",
        mobileNoInit: "0112340293",
        imageInit: "sakinah.jpeg"),
  ];

  List<User> getAllMua() {
    List<User> muaUsers = allUsers.where((x) => x.userType == "Mua").toList();

    return muaUsers;
  }

  User getSingleMua(String name) {
    User singleMua = allUsers.firstWhere((element) => element.username == name);

    return singleMua;
  }

  User getSingleUser(String email, String password) {
    User singleUser = allUsers.firstWhere(
        (element) => element.email == email && element.password == password);

    return singleUser;
  }

  void setLoginUser(User data) {
    signedIn.username = data.username;
    signedIn.email = data.email;
    signedIn.userType = data.userType;
    signedIn.image = data.image;
  }

  User getLoginUser() {
    return signedIn;
  }
}
