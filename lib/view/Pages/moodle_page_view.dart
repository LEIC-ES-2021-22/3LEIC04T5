import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/deadLines.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/moodle_page_title.dart';
import 'package:uni/view/Widgets/schedule_row_moodle.dart';
import 'package:uni/view/Widgets/title_card.dart';

import '../../controller/exam.dart';
import '../../model/app_state.dart';
import '../../model/entities/exam.dart';
import '../Widgets/row_container.dart';
import '../Widgets/schedule_row.dart';

class MoodlePageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  MoodlePageViewState();
}

///Tracks the state of 'Moodle date list'
class MoodlePageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

 @override
 Widget getBody(BuildContext context) {
   return StoreConnector<AppState, List<dynamic>> (
     converter: (store) {
       final List<DeadLines> deadlines = store.state.content['moodle'];
       return deadlines;
     },
     builder: (context,deadlines) {
       return DeadLinesList(deadlines: deadlines);
     }
   );
 }
}

class DeadLinesList extends StatelessWidget {
  final List<DeadLines> deadlines;

  DeadLinesList({Key key, @required this.deadlines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.createDeadlineColumn(context, deadlines),

          ),
        )
      ],
    );
  }

  /// Creates a column with all the user's deadlines.
  List<Widget> createDeadlineColumn(context, deadlines) {
    final List<Widget> columns = <Widget>[];
    columns.add(MoodlePageTitle(
      name: 'Datas Moodle',
    ));


    final List<DeadLines> currentDayDeadlines = <DeadLines>[];

    for (int i = 0; i < deadlines.length; i++) {
      if (i + 1 >= deadlines.length) {
        if (deadlines[i].day == deadlines[i - 1].day &&
            deadlines[i].month == deadlines[i - 1].month) {
          currentDayDeadlines.add(deadlines[i]);
        } else {
          if (currentDayDeadlines.isNotEmpty) {
            columns.add(this.createDeadlineCard(context, currentDayDeadlines));
          }
          currentDayDeadlines.clear();
          currentDayDeadlines.add(deadlines[i]);
        }
        columns.add(this.createDeadlineCard(context, currentDayDeadlines));
        break;
      }
    }

    return columns;
  }

  Widget createDeadlineCard(context, deadlines) {
    final keyValue = deadlines.map((deadline) => deadline.toString()).join();
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: this.createDeadlinesCards(context, deadlines),
    );
  }

  Widget createDeadlinesCards(context, deadlines) {
    final List<Widget> deadlineCards = <Widget>[];
    deadlineCards.add(TitleCard(
        day: deadlines[0].day, weekDay: deadlines[0].weekDay, month: deadlines[0].month));
    for (int i = 0; i < deadlines.length; i++) {
      deadlineCards.add(this.createDeadlineContext(context, deadlines[i]));
    }
    return Column(children: deadlineCards);
  }

  Widget createDeadlineContext(context, deadline) {
    final keyValue = '${deadline.toString()}-deadline';
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RowContainer(
            color: isHighlighted(deadline)
                ? Theme.of(context).hintColor
                : Theme.of(context).backgroundColor,
            child:
          ScheduleRowMoodle(
              subject: deadline.subject,
              type: deadline.deadlinetype,
              date: deadline.date
          )
        ));
  }
}