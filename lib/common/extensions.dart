// ignore_for_file: unnecessary_this

extension DateOnlyCompare on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  bool get isToday => this.isSameDay(DateTime.now());

  String toIsoDateString() {
    return "${this.year}-${this.month.toString().padLeft(2, '0')}-${this.day.toString().padLeft(2, '0')}";
  }
}
