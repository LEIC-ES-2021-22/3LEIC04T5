//import 'package:html/parser.dart';
//import 'package:http/http.dart' as http;
//import 'package:uni/model/entities/deadLines.dart';
//import 'package:uni/model/entities/exam.dart';
//
/////parses information about the user's deadlines
//class ParserDeadlines {
//  /// Return the abbreviature of the deadlines season.
//  ///
//  ///  If an abbreviatire doesn't exist, a '?' is returned.
//  String getDeadlinesSeasonAbbr(String seasonStr) {
//    final Map<String,String> deadlineTypes = DeadLines.getDeadlinesTypes();
//    for(String type in deadlineTypes.keys) {
//      if (seasonStr.contains(type)) return deadlineTypes[type];
//    }
//    return '?';
//  }
//
//  /// Extracts a list of deadlines from an HTTP [response].
//  Future<Set<Exam>> parseExams(http.Response response) async {
//    final document = parse(response.body);
//
//    final Set<DeadLines> deadlinesList = Set();
//    final List<String> dates = [];
//    final List<String> deadlineType = [];
//    final List<String> weekDays = [];
//    String subject;
//    int days = 0;
//
//    document.querySelectorAll('#yui_3_17_2_1_1653849982092_1272').forEach((element) { })
//  }
//}