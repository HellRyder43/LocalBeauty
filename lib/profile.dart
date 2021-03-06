import 'package:flutter/material.dart';
import 'package:local_beauty/models/user.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/navbar.dart';

UserRepository userList = new UserRepository();

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User loginUser = userList.getLoginUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: CustomAppBar("My Profile"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/" + loginUser.image),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: loginUser.username),
              //controller: emailTextEditingCtrl,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: loginUser.location),
              //controller: emailTextEditingCtrl,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: loginUser.mobileNo),
              //controller: passwordTextEditingCtrl,
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: loginUser.email),
              //controller: passwordTextEditingCtrl,
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {},
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Update",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
