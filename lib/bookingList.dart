import 'package:flutter/material.dart';
import 'package:local_beauty/bookRepository.dart';
import 'package:local_beauty/models/BookingDetail.dart';
import 'package:local_beauty/models/bookEvent.dart';
import 'package:local_beauty/models/user.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';

BookRepository bookList = new BookRepository();
UserRepository userList = new UserRepository();

class BookingList extends StatefulWidget {
  @override
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  User signedIn = new User();
  List<BookEvent> bookEvents = bookList.allBookEvents;
  List<BookingDetail> bookCards = [];

  // final List<BookingDetail> cards = [
  //   BookingDetail(
  //       name: "Customer 1",
  //       bookDate: "02 September 2021",
  //       event: "Wedding",
  //       price: "RM 99"),
  //   BookingDetail(
  //       name: "Customer 2",
  //       bookDate: "05 September 2021",
  //       event: "Dinner",
  //       price: "RM 300"),
  // ];

  @override
  void initState() {
    // TODO: implement initState
    signedIn = userList.getLoginUser();

    bookEvents = bookEvents
        .where((element) => element.muaName == signedIn.username)
        .toList();

    for (int i = 0; i < bookEvents.length; i++) {
      bookCards.add(BookingDetail(
          name: bookEvents[i].name,
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
      appBar: CustomAppBar("Booking List"),
      body: Column(
        children: [
          Expanded(
            flex: 5,
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
          )
        ],
      ),
    );
  }
}
