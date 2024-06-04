import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:request_manager/environment/environment.dart';
import 'package:request_manager/model/typeRequest.model.dart';

class RequestController extends GetxController {
  RxBool isLoadLogin = false.obs;
  Future<dynamic> getTypeRequest() async {
    print('gtr');

    final response = await http.get(
      Uri.parse(baseUrl + "api/typeRequests"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('object');
      final data = jsonDecode(response.body);
      List<Identification> fetchedMatchAllTeam = [];
      for (var matchAllTeamJson in data['body']) {
        fetchedMatchAllTeam.add(Identification.fromJson(matchAllTeamJson));
      }
      print(fetchedMatchAllTeam.length);
      return fetchedMatchAllTeam;
    } else {
      throw Exception('Failed to fetch match all team data');
    }
  }
}
