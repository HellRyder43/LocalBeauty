class BookEvent {
  String name;
  String muaName;
  String event;
  String date;
  String price;
  String address;
  String time;
  String mobileNo;

  BookEvent(
      {String nameInit,
      String muaNameInit,
      String eventInit,
      String dateInit,
      String priceInit,
      String addressInit,
      String timeInit,
      String mobileNoInit}) {
    name = nameInit;
    muaName = muaNameInit;
    event = eventInit;
    date = dateInit;
    price = priceInit;
    address = addressInit;
    time = timeInit;
    mobileNo = mobileNoInit;
  }
}
