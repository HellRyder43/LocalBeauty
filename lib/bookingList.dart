import 'package:flutter/material.dart';
import 'package:local_beauty/models/BookingDetail.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';

class BookingList extends StatefulWidget {
  @override
  _BookingListState createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  final List<BookingDetail> cards = [
    BookingDetail(
        name: "Customer 1",
        bookDate: "02 September 2021",
        event: "Wedding",
        price: "RM 99"),
    BookingDetail(
        name: "Customer 2",
        bookDate: "05 September 2021",
        event: "Dinner",
        price: "RM 300"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Booking List"),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardBooking(
                name: cards[index].name,
                bookDate: cards[index].bookDate,
                event: cards[index].event,
                price: cards[index].price,
              ),
            ),
          )
        ],
      ),
    );
  }
}
