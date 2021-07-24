import 'package:flutter/material.dart';
import 'package:local_beauty/bookRepository.dart';
import 'package:local_beauty/menu.dart';
import 'package:local_beauty/models/bookEvent.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';

import 'models/user.dart';

BookRepository bookList = new BookRepository();
UserRepository userList = new UserRepository();

class Payment extends StatefulWidget {
  final DateTime date;
  final String time;
  final String eventType;
  final String eventPrice;
  final String muaName;
  final String mobileNo;
  final String address;

  const Payment(
      {Key key,
      this.eventType,
      this.eventPrice,
      this.date,
      this.time,
      this.muaName,
      this.mobileNo,
      this.address})
      : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _value = 1;
  User signedIn = new User();

  @override
  void initState() {
    // TODO: implement initState
    signedIn = userList.getLoginUser();
    super.initState();
  }

  bool setBooking(
      {String name,
      String muaName,
      String event,
      DateTime date,
      String price,
      String address,
      String time,
      String mobileNo}) {
    BookEvent data = new BookEvent();

    data.name = name;
    data.muaName = muaName;
    data.event = event;
    data.date = date.day.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.year.toString();
    data.price = price;
    data.address = address;
    data.time = time;
    data.mobileNo = mobileNo;

    print(data.name);
    print(data.muaName);
    print(data.event);
    print(data.date);
    print(data.price);
    print(data.address);
    print(data.time);
    print(data.mobileNo);

    bookList.setBookEvent(data);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Payment"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event Information: ",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Date: " +
                      widget.date.year.toString() +
                      "-" +
                      widget.date.month.toString() +
                      "-" +
                      widget.date.day.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Time: " + widget.time,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Event: " + widget.eventType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price: RM " + widget.eventPrice,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Online Payment: ",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bank:",
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("Maybank"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Affin Bank"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Alliance Bank"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("AmBank"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("Bank Islam"),
                      value: 5,
                    ),
                    DropdownMenuItem(
                      child: Text("Cimb Bank"),
                      value: 6,
                    ),
                    DropdownMenuItem(
                      child: Text("RHB Bank"),
                      value: 7,
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
                SizedBox.shrink(),
              ],
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              onPressed: () {
                bool book = setBooking(
                    name: signedIn.username,
                    muaName: widget.muaName,
                    event: widget.eventType,
                    date: widget.date,
                    price: widget.eventPrice,
                    address: widget.address,
                    time: widget.time,
                    mobileNo: widget.mobileNo);

                if (book) {
                  //Show Alert Dialog Success
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Payment Status'),
                      content: const Text(
                        'Success',
                        style: TextStyle(color: Colors.green),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Menu(),
                                ));
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Pay",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
