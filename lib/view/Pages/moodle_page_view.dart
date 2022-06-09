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
     },
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
        ),
        Container(
          child: IntrinsicHeight(
         child: Row(
        children: <Widget>[
        Container(
        margin: EdgeInsets.only(top: 4.0, bottom: 12.0),
        child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Align(
            alignment: Alignment(.2,-.8),
            child: Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 10),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Align(
            alignment: Alignment(-0,-0.68),
            child: Text(
              'CheckPoint',
              style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
            ),
              ),
              ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0.35,-0.68),
              child: Text(
                'ES',
                style: TextStyle(color: Colors.red,fontSize: 18),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0,-0.9),
              child: Text(
                'Sexta, 01 de Abril',
                style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          //--------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(.2,-.2),
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 10),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 10),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(-0,-0.18),
              child: Text(
                'Kahoot',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0.30,-0.18),
              child: Text(
                'IA',
                style: TextStyle(color: Colors.red,fontSize: 18),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0,-0.33),
              child: Text(
                'Quarta, 06 de Abril',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          //--------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(.2,0.3),
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 10),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 10),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(-0,0.28),
              child: Text(
                'CheckPoint',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0.35,0.28),
              child: Text(
                'DA',
                style: TextStyle(color: Colors.red,fontSize: 18),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0,0.13),
              child: Text(
                'Quarta, 20 de Abril',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          //----------------------------------
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(.2,0.8),
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(233, 233, 233, 10),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 10),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(-0,0.75),
              child: Text(
                'Kahoot',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0.30,0.75),
              child: Text(
                'IA',
                style: TextStyle(color: Colors.red,fontSize: 18),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Align(
              alignment: Alignment(0,0.60),
              child: Text(
                'Terça, 03 de Maio',
                style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w300),
              ),
            ),
          ),
          ],
        ),
        ),
        ],
          ),
    ),
    ),],
    );

 //  return ListView(
 //    children: <Widget>[
 //      Container(
 //        child: Column(
 //          mainAxisSize: MainAxisSize.max,
 //          children: this.createDeadlineColumn(context, deadlines),
 //        ),
 //      )
 //    ],
 //  );
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
              //date: deadline.date
          )
        ));
  }
}