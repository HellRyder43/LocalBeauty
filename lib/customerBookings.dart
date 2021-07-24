import 'package:flutter/material.dart';
import 'package:local_beauty/bookRepository.dart';
import 'package:local_beauty/models/BookingDetail.dart';
import 'package:local_beauty/models/bookEvent.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';
import 'package:local_beauty/widgets/navbar.dart';

import 'models/user.dart';

BookRepository bookList = new BookRepository();
UserRepository userList = new UserRepository();

class CustomerBooking extends StatefulWidget {
  @override
  _CustomerBookingState createState() => _CustomerBookingState();
}

class _CustomerBookingState extends State<CustomerBooking> {
  User signedIn = new User();
  List<BookEvent> bookEvents = bookList.allBookEvents.toList();
  List<BookingDetail> bookCards = [];

  // final List<BookingDetail> cards = [
  //   BookingDetail(
  //       name: "Abu",
  //       bookDate: "22 June 2020",
  //       event: "Wedding",
  //       price: "RM 250"),
  //   BookingDetail(
  //       name: "Ali",
  //       bookDate: "23 June 2020",
  //       event: "Dinner",
  //       price: "RM 150"),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    signedIn = userList.getLoginUser();

    bookEvents = bookEvents
        .where((element) => element.name == signedIn.username)
        .toList();

    //print("Book Events :" + bookEvents.length.toString());

    // bookCards = [
    //   BookingDetail(
    //       name: bookEvents[0].muaName != null ? "Ada" : "Takda",
    //       bookDate: "22 June 2020",
    //       event: "Wedding",
    //       price: "RM 250"),
    //   BookingDetail(
    //       name: "Ali",
    //       bookDate: "23 June 2020",
    //       event: "Dinner",
    //       price: "RM 150"),
    // ];

    for (int i = 0; i < bookEvents.length; i++) {
      bookCards.add(BookingDetail(
          name: bookEvents[i].muaName,
          bookDate: bookEvents[i].date,
          event: bookEvents[i].event,
          price: "RM " + bookEvents[i].price,
          address: bookEvents[i].address,
          time: bookEvents[i].time,
          mobileNo: bookEvents[i].mobileNo));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: CustomAppBar("My Booking"),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: bookCards.length,
              itemBuilder: (context, index) => CardBooking(
                name: bookCards[index].name,
                bookDate: bookCards[index].bookDate,
                event: bookCards[index].event,
                price: bookCards[index].price,
                address: bookCards[index].address,
                time: bookCards[index].time,
                mobileNo: bookCards[index].mobileNo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
