import 'package:flutter/material.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/navbar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              child: Image.asset(
                "assets/noProfile.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
              //controller: emailTextEditingCtrl,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Location'),
              //controller: passwordTextEditingCtrl,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Phone No.'),
              //controller: passwordTextEditingCtrl,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
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
