import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Auni Dalilah",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            accountEmail: Text(
              "aunidalilah.mz@gmail.com",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/Auni.jpeg",
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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_view_day),
            title: Text("My Bookings"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
