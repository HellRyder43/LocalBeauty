import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_beauty/models/cardDetail.dart';
import 'package:local_beauty/models/user.dart';
import 'package:local_beauty/styles.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';
import 'package:local_beauty/widgets/navbar.dart';

class Menu extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final LoggedInUser userData;

  const Menu({Key key, this.controller, this.focusNode, this.userData})
      : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<CardDetail> cards = [
    CardDetail(title: 'Name', subtitle: 'Description'),
    CardDetail(title: 'Name', subtitle: 'Description'),
    CardDetail(title: 'Name', subtitle: 'Description'),
    CardDetail(title: 'Name', subtitle: 'Description'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(
        userData: widget.userData,
      ),
      appBar: CustomAppBar("Main Menu"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Styles.searchBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: Styles.searchIconColor,
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: widget.controller,
                        focusNode: widget.focusNode,
                        style: Styles.searchText,
                        cursorColor: Styles.searchCursorColor,
                        decoration: null,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.clear_thick_circled,
                        color: Styles.searchIconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
