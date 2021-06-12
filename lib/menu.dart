import 'package:flutter/material.dart';
import 'package:local_beauty/widgets/navbar.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Local Beauty"),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
