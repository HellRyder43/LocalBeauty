import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_beauty/models/cardDetail.dart';
import 'package:local_beauty/models/user.dart';
import 'package:local_beauty/styles.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';
import 'package:local_beauty/widgets/navbar.dart';

UserRepository userList = new UserRepository();

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode;

  List<User> muaUsers = userList.getAllMua().toList();
  List<CardDetail> muaCards = [];

  @override
  void initState() {
    // TODO: implement initState
    // muaCards = [
    //   CardDetail(
    //       title: muaUsers[0].username,
    //       subtitle: muaUsers[0].location,
    //       imagePath: muaUsers[0].image),
    //   CardDetail(
    //       title: muaUsers[1].username,
    //       subtitle: muaUsers[1].location,
    //       imagePath: muaUsers[1].image)
    // ];

    for (int i = 0; i < muaUsers.length; i++) {
      muaCards.add(CardDetail(
          title: muaUsers[i].username,
          subtitle: muaUsers[i].location,
          imagePath: muaUsers[i].image));
    }

    super.initState();
  }

  clearTextInput() {
    controller.clear();
    filterSearchResults("");
  }

  void fillInMuaCards() {
    for (int i = 0; i < muaUsers.length; i++) {
      muaCards.add(
        CardDetail(
            title: muaUsers[i].username,
            subtitle: muaUsers[i].location,
            imagePath: muaUsers[i].image),
      );
    }
  }

  void filterSearchResults(String query) {
    List<CardDetail> searchList = [];
    searchList.addAll(muaCards);
    print(searchList.length.toString() + "  asdadasd");
    if (query.isNotEmpty) {
      List<CardDetail> listData = [];
      searchList.forEach((element) {
        if (element.subtitle.toLowerCase() == query.toLowerCase()) {
          print("Found data " + element.subtitle);
          listData.add(element);
          print("In List data " + listData[0].title);
          setState(() {
            muaCards.clear();
            muaCards.addAll(listData);
          });
        }
      });
    } else {
      setState(() {
        muaCards.clear();
        fillInMuaCards();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
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
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        controller: controller,
                        focusNode: focusNode,
                        style: Styles.searchText,
                        cursorColor: Styles.searchCursorColor,
                        decoration: null,
                      ),
                    ),
                    GestureDetector(
                      onTap: clearTextInput,
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
              itemCount: muaCards.length,
              itemBuilder: (context, index) => CardListTile(
                title: muaCards[index].title,
                subtitle: muaCards[index].subtitle,
                imagePath: muaCards[index].imagePath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
