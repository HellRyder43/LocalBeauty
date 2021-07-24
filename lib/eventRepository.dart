import 'package:local_beauty/models/event.dart';

class EventRepository {
  EventRepository._privateConstructor();

  static final EventRepository _instance =
      EventRepository._privateConstructor();

  factory EventRepository() {
    return _instance;
  }

  // List<Events> allEvents = [
  //   Events(
  //     eventTypeInit: "Wedding",
  //     eventPriceInit: "1500",
  //   ),
  //   Events(
  //     eventTypeInit: "Convocation",
  //     eventPriceInit: "300",
  //   ),
  //   Events(
  //     eventTypeInit: "Dinner",
  //     eventPriceInit: "800",
  //   )
  // ];
}
