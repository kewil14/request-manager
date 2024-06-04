import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:request_manager/environment/environment.dart';
import 'package:request_manager/model/typeRequest.model.dart';

class RequestController extends GetxController {
  RxBool isLoading = false.obs; // Utiliser isLoading au lieu de isLoadLogin
  // Liste observable pour stocker les données

  Future<dynamic> getTypeRequest() async {
    isLoading.value =
        true; // Définir isLoading à true avant la requête [[2]](https://poe.com/citation?message_id=193454578720&citation=2)
    try {
      final response = await http.get(
        Uri.parse(baseUrl + "api/typeRequests"),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        /*List<Identification> fetchedMatchAllTeam = [];
        for (var matchAllTeamJson in data['']) {
          fetchedMatchAllTeam.add(Identification.fromJson(matchAllTeamJson));
        }*/

        return data;
      } else {
        throw Exception('Failed to fetch match all team data');
      }
    } catch (e) {
      print(
          e); // Gérer l'exception correctement (ex: afficher un message d'erreur)
    }
  }
/*Future<dynamic> getTypeRequest() async {
    isLoading.value =
    true; // Définir isLoading à true avant la requête [[2]](https://poe.com/citation?message_id=193454578720&citation=2)
    try {
      final response = await http.get(
        Uri.parse(baseUrl + "api/typeRequests"),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        identifications = (data[''] as List)
            .map((json) => Identification.fromJson(json))
            .toList(); // Mapper les données JSON à des instances de Identification [[3]](https://poe.com/citation?message_id=193454578720&citation=3)
        return data;
      } else {
        throw Exception(
            'Failed to fetch data'); // Lever une exception en cas d'erreur
      }
    } catch (e) {
      print(
          e); // Gérer l'exception correctement (ex: afficher un message d'erreur)
    } finally {
      isLoading.value =
      false; // Définir isLoading à false après la requête [[2]](https://poe.com/citation?message_id=193454578720&citation=2)
    }
  }*/
}
