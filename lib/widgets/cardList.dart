import 'package:flutter/material.dart';
import 'package:local_beauty/bookingForm.dart';

class CardListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  CardListTile({this.title, this.subtitle, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      color: Colors.pinkAccent,
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
            backgroundImage: AssetImage("assets/$imagePath"),
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookingForm(
                          muaName: title,
                        )));
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
  final String address;
  final String time;
  final String mobileNo;

  CardBooking({this.name, this.bookDate, this.event, this.price, this.address, this.time, this.mobileNo});

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
              Text(address),
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
              Text(time),
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
              Text(mobileNo),
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
        color: Colors.pinkAccent,
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
