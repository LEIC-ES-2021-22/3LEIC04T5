import 'package:redux/src/store.dart';
import 'package:uni/controller/schedule_fetcher/schedule_fetcher.dart';
import 'package:uni/model/entities/lecture.dart';

import '../model/app_state.dart';

///class for fetching the lecture info from the faculty' API.

class InfoFetcherApi extends ScheduleFetcher {
  ///Fetches the user's lectures from the faculty's API.

  @override
  Future<List<Lecture>> getInfo(Store<AppState> store) async {

  }

  @override
  Future<List<Lecture>> getLectures(Store<AppState> store) {
    // TODO: implement getLectures
    throw UnimplementedError();
  }
}