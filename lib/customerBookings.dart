import 'package:flutter/material.dart';
import 'package:local_beauty/models/BookingDetail.dart';
import 'package:local_beauty/widgets/appBar.dart';
import 'package:local_beauty/widgets/cardList.dart';
import 'package:local_beauty/widgets/navbar.dart';

class CustomerBooking extends StatefulWidget {
  @override
  _CustomerBookingState createState() => _CustomerBookingState();
}

class _CustomerBookingState extends State<CustomerBooking> {
  final List<BookingDetail> cards = [
    BookingDetail(
        name: "Abu",
        bookDate: "22 June 2020",
        event: "Wedding",
        price: "RM 250"),
    BookingDetail(
        name: "Ali",
        bookDate: "23 June 2020",
        event: "Dinner",
        price: "RM 150"),
  ];

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
              itemCount: cards.length,
              itemBuilder: (context, index) => CardBooking(
                name: cards[index].name,
                bookDate: cards[index].bookDate,
                event: cards[index].event,
                price: cards[index].price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
