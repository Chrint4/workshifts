import 'dart:ui';

const String kAppTitle = "WorkMarker";

const double kDefaultPadding = 16.0;

const Color kPrimaryCol = Color(0xFF334FCC);
const Color kPrimaryColLight = Color(0xFF5C72E0);
const Color kPrimaryColDark = Color(0xFF253A8C);

const Color kTextCol = Color(0xff3c4046);
const Color kBackgroundCol = Color(0xFFf9f8fd);

const double kCardHeight = 100;

class DayOfWeek {
  final String day;

  String get short => day.substring(0, 3).toUpperCase();

  const DayOfWeek({required this.day});
}

const List<DayOfWeek> kWeek = [
  DayOfWeek(day: "Monday"),
  DayOfWeek(day: "Tuesday"),
  DayOfWeek(day: "Wednesday"),
  DayOfWeek(day: "Thursday"),
  DayOfWeek(day: "Friday"),
  DayOfWeek(day: "Saturday"),
  DayOfWeek(day: "Sunday"),
];
