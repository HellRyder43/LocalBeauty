import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:local_beauty/eventRepository.dart';
import 'package:local_beauty/models/event.dart';
import 'package:local_beauty/payment.dart';
import 'package:local_beauty/user_repository.dart';
import 'package:local_beauty/widgets/appBar.dart';

import 'models/user.dart';

UserRepository userList = new UserRepository();

class BookingForm extends StatefulWidget {
  final String muaName;

  BookingForm({this.muaName});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  User mua = new User();

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String _selectedTime;

  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  String eventPrice = "0";

  List<Events> _dropdownItems = [
    Events(eventIdInit: 1, eventTypeInit: "Wedding", eventPriceInit: "1500"),
    Events(eventIdInit: 2, eventTypeInit: "Convocation", eventPriceInit: "300"),
    Events(eventIdInit: 3, eventTypeInit: "Dinner", eventPriceInit: "800"),
  ];

  List<DropdownMenuItem<Events>> _dropdownMenuItems;
  Events _selectedItem;

  List<DropdownMenuItem<Events>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Events>> items = [];
    for (Events listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.eventType),
          value: listItem,
        ),
      );
    }
    return items;
  }

  String address;

  @override
  void initState() {
    // TODO: implement initState
    mua = userList.getSingleMua(widget.muaName);
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Booking Form"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/" + mua.image),
              ),
              Text(
                "MUA Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mua.username,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mua.location,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mua.mobileNo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required"),
                        ]),
                        onChanged: (String value) {
                          address = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: () => _selectDate(context), // Refer step 3
                    child: Text(
                      'Select date',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Time: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    _selectedTime != null ? _selectedTime : 'No time selected!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: _show, // Refer step 3
                    child: Text(
                      'Select time',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Event: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<Events>(
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                        eventPrice = value.eventPrice;
                      });
                    },
                  ),
                  SizedBox.shrink(),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price: ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "RM " + eventPrice,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox.shrink(),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment(
                          date: selectedDate,
                          time: _selectedTime.toString(),
                          eventType: _selectedItem.eventType,
                          eventPrice: _selectedItem.eventPrice,
                          mobileNo: mua.mobileNo,
                          muaName: widget.muaName,
                          address: address,
                        ),
                      ));
                },
                // onPressed: () => showDialog<String>(
                //   context: context,
                //   builder: (BuildContext context) => AlertDialog(
                //     title: const Text('Payment'),
                //     content: const Text('Online Banking'),
                //     actions: <Widget>[
                //       TextButton(
                //         onPressed: () => Navigator.pop(context, 'Cancel'),
                //         child: Text('Cancel'),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         child: Text("OK"),
                //       ),
                //     ],
                //   ),
                // ),
                color: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Confirm Booking",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
