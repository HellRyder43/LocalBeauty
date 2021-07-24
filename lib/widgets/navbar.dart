import 'package:flutter/material.dart';
import 'package:local_beauty/bookingList.dart';
import 'package:local_beauty/customerBookings.dart';
import 'package:local_beauty/main.dart';
import 'package:local_beauty/menu.dart';
import 'package:local_beauty/models/user.dart';
import 'package:local_beauty/profile.dart';
import 'package:local_beauty/user_repository.dart';

import '../paymentList.dart';

UserRepository userList = new UserRepository();

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  User signedIn = new User();

  @override
  void initState() {
    // TODO: implement initState
    signedIn = userList.getLoginUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              signedIn.username,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              signedIn.email,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/" + signedIn.image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  "https://thumbs.dreamstime.com/b/woman-makeup-background-beauty-products-cosmetics-top-view-pink-table-flat-lay-style-woman-makeup-background-151402070.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Main Menu"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Menu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          signedIn.userType == "Mua"
              ? SizedBox.shrink()
              : signedIn.userType == "Admin"
                  ? SizedBox.shrink()
                  : ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("My Bookings"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerBooking()));
                      },
                    ),
          signedIn.userType == "Customer"
              ? SizedBox.shrink()
              : signedIn.userType == "Admin"
                  ? SizedBox.shrink()
                  : ListTile(
                      leading: Icon(Icons.list_alt),
                      title: Text("Booking List"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingList()));
                      },
                    ),
          signedIn.userType == "Admin"
              ? ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Booking Record"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PaymentList()));
                  },
                )
              : SizedBox.shrink(),
          Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text("Settings"),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
