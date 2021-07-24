import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:local_beauty/bookingForm.dart';
import 'package:local_beauty/bookingList.dart';
import 'package:local_beauty/customerBookings.dart';
import 'package:local_beauty/login.dart';
import 'package:local_beauty/menu.dart';
import 'package:local_beauty/payment.dart';
import 'package:local_beauty/paymentList.dart';
import 'package:local_beauty/profile.dart';
import 'package:local_beauty/signup.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/Menu": (BuildContext context) => new Menu(),
        "/Login": (BuildContext context) => new LoginPage(),
        "/SignUp": (BuildContext context) => new SignUpPage(),
        "/Profile": (BuildContext context) => new Profile(),
        "/Home": (BuildContext context) => new HomePage(),
        "/BookingForm": (BuildContext context) => new BookingForm(),
        "/BookingList": (BuildContext context) => new BookingList(),
        "/CustomerBooking": (BuildContext context) => new CustomerBooking(),
        "/Payment": (BuildContext context) => new Payment(),
        "/PaymentList": (BuildContext context) => new PaymentList(),
      }));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.jpeg"))),
                ),
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      color: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
