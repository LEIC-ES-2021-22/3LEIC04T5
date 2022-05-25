import 'package:flutter/cupertino.dart';
import 'package:uni/view/Widgets/schedule_event_rectangle.dart';
import 'package:uni/view/Widgets/schedule_time_interval.dart';

class ScheduleRowMoodle extends StatelessWidget {
   String subject = 'ES';
  final DateTime date;
   String type = 'CheckPoint';

  ScheduleRowMoodle(
  {Key key,
  @required this.subject,
  this.date,
  this.type})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12),
        margin: EdgeInsets.only(top: 8.0),
        child: IntrinsicHeight(
          child: Row (
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60.0, bottom: 45.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  )),
              Container(
                margin: EdgeInsets.only(top: 60.0, bottom: 45.0),
                child: ScheduleEventRectangle(
                  subject: this.subject, type: this.type))
    ],
    )),
    ));
  }
}