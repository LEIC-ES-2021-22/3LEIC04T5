import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/Lecture_page_title.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';

class LectureInfoPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LectureInfoPageState();

}

class LectureInfoPageState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return InfoList();
  }

}

class InfoList extends StatelessWidget {
  final List<Lecture> lecture;
  InfoList ({Key key, @required this.lecture}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: this.createInfoColumn(context,lecture),
          ),
        ),
      ],
    );
  }
  
  ///creates a column with all the user's exams. 
  List<Widget> createInfoColumn(context,lecture) {
    final List<Widget> columns = <Widget>[];
    columns.add(InfoPageTitle(
      name: lecture.subject,
    ));

    return columns;
  }
}