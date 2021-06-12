import 'package:flutter/material.dart';
import 'package:local_beauty/bookingForm.dart';

class CardListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  CardListTile({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: Colors.blueAccent,
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1.0,
                color: Colors.white24,
              ),
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/Auni.jpeg"),
            radius: 30,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            // Icon(
            //   Icons.linear_scale,
            //   color: Colors.yellow,
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookingForm()));
          },
          icon: Icon(Icons.keyboard_arrow_right),
          color: Colors.white,
          iconSize: 30.0,
          // Icons.keyboard_arrow_right,
          // color: Colors.white,
          // size: 30.0,
        ),
      ),
    );
  }
}

class CardBooking extends StatelessWidget {
  final String name;
  final String bookDate;
  final String event;
  final String price;

  CardBooking({this.name, this.bookDate, this.event, this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Address",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("No 43a, Jalan Cerdik 3, Taman Universiti"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("12:00 PM"),
              SizedBox(
                height: 20,
              ),
              Text(
                "Phone No",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text("0129786577"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        color: Colors.blueAccent,
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            title: Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                // Icon(
                //   Icons.linear_scale,
                //   color: Colors.yellow,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                Text(
                  event,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  bookDate,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            trailing: Text(
              price,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
