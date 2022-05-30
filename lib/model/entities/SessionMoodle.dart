import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uni/controller/networking/network_router.dart';

class moodle_Session {
  bool authenticated1;
  bool persistantSession1 = false;
  String coockies;
  String type;
  String studentNumber;
  Future loginRequest1;

  moodle_Session(
    {@required bool this.authenticated1,
    this.studentNumber,
    this.type,
    this.coockies}) {}

  ///creates a new instance from a HTTP response containing a JSON document.
  static moodle_Session fromMoodlelogin(dynamic response) {
    final responseBody = json.decode(response.body);
    if (responseBody['authenticated']) {
      return moodle_Session(
          authenticated1: true,
          studentNumber: responseBody['codigo'],
      type: responseBody['tipo'],
      coockies: NetworkRouter.extractCookies(response.headers));
    } else {
      return moodle_Session(authenticated1: false);
    }
  }
}