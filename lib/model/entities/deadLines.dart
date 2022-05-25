import 'package:logger/logger.dart';

var months = {
  'Janeiro': '01',
  'Fevereiro': '02',
  'Março': '03',
  'Abril': '04',
  'Maio': '05',
  'Junho': '06',
  'Julho': '07',
  'Agosto': '08',
  'Setembro': '09',
  'Outubro': '10',
  'Novembro': '11',
  'Dezembro': '12'
};

var _types = {
  'CheckPoints' : 'Checkpoints',
  'Kahoot': 'Kahoot'
};

class DeadLines {
  String subject;
  String day;
  String deadlineType;
  String weekday;
  String month;
  String year;
  DateTime date;

  DeadLines.secConstructor(String subject, String day,
                            String deadlineType, String weekDay, String month, String year) {
    this.subject = subject;
    this.day = day;
    this.deadlineType = deadlineType;
    this.weekday = weekDay;
    this.month = month;
    this.year = year;

    final monthKey = months[this.month];
    this.date = DateTime.parse(year + '-' + monthKey + '-' + day);
  }

    DeadLines(String schedule, String subject, String date,
              String deadlineType, String weekday) {
    this.subject = subject;
    this.date = DateTime.parse(date);
    final scheduling = schedule.split('-');
    final dateSepared = date.split('-');
    this.year = dateSepared[0];
    this.day = dateSepared[2];
    this.deadlineType = deadlineType;
    this.weekday = weekday;

    this.month = months.keys
        .firstWhere((k) => months[k] == dateSepared[1], orElse: () => null);
    }

    ///converts this deadline to a map.
    Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'day': day,
      'deadlineType': deadlineType,
      'weekDay': weekday,
      'month': month,
      'year': year
    };
    }

    ///Return wheter or not this exam has already ended.
    bool hasEnded() {
      final DateTime now = DateTime.now();
      final DateTime endDateTime =
          DateTime(date.year,date.month,date.day);
      return now.compareTo(endDateTime) <= 0;
    }

    ///prints the data in this deadLine to the [Logger] with an INFO level
    void printDeadLine() {
      Logger().i(
          '''$subject - $year - $month - $day - $deadlineType - $weekday''');
    }

    @override
    String toString() {
      return '''$subject - $year - $month - $day - $deadlineType - $weekday''';
    }

    @override
  bool operator ==(Object other) =>
        identical(this, other) ||
        other is DeadLines &&
            runtimeType == other.runtimeType &&
            subject == other.subject &&
            day == other.day &&
            deadlineType == other.deadlineType &&
            weekday == other.weekday &&
            month == other.month &&
            year == other.year;

  @override
  int get hashCode =>
    subject.hashCode ^
    day.hashCode ^
    deadlineType.hashCode ^
    weekday.hashCode ^
    month.hashCode ^
    year.hashCode;

  static Map<String,String> getDeadlinesTypes() {
    return _types;
  }

  static getDeadlinesTypeLong(String abr) {
    final Map<String, String> reversed = _types.map((k, v) => MapEntry(v, k));
    return reversed[abr];
  }
}