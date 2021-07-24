import 'package:local_beauty/models/bookEvent.dart';

class BookRepository {
  BookRepository._privateConstructor();

  static final BookRepository _instance = BookRepository._privateConstructor();

  factory BookRepository() {
    return _instance;
  }

  List<BookEvent> allBookEvents = [];

  List<BookEvent> getAllBookEvent(String name) {
    return allBookEvents.where((element) => element.name == name);
  }

  BookEvent getSingleBookEvent(String name, String muaName) {
    return allBookEvents
        .where((element) => element.name == name && element.muaName == muaName)
        .first;
  }

  void setBookEvent(BookEvent data) {
    allBookEvents.add(data);
  }
}
