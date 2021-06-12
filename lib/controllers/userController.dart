import 'package:local_beauty/models/user.dart';
import 'package:get/get.dart';

class UserContoller extends GetxController {
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() {
    var allUsers = [
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

    users.value = allUsers;
  }
}
