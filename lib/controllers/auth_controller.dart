import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/environment/environment.dart';
import 'package:request_manager/routes/name_route.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final GlobalKey<FormState> formLoginEmailKey = GlobalKey<FormState>();

  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoadLogin = false.obs;

  Future<void> login(BuildContext context) async {
    if (formLoginEmailKey.currentState!.validate()) {
      var response = await http.post(Uri.parse(baseUrl + '/api/users'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "matricule": identifierController.text,
            "password": passwordController.text,
          }));

      /*  if (response.statusCode == 200) {
        // La requête a réussi
        print('Requête POST réussie');
        final responseData = json.decode(response.body);
        */ /*final username = responseData['username'];
        final email = responseData['email'];
        final numberPhone = responseData['numberPhone'];*/ /*
        final datas = responseData['body'];

        */ /* SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setString('username', username);
        await prefs.setString('email', email);
        await prefs.setString('numberPhone', numberPhone);*/ /*
        return datas;
      } else if (response.statusCode == 401) {
        const res = 'revfrty';
      }*/
    }
    isLoadLogin.value = true;
    await Future.delayed(const Duration(seconds: 2));
    context.pushNamed(AppRoutes.home);
    isLoadLogin.value = false;
  }
}
