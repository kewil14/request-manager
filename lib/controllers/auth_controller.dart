import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/environment/environment.dart';
import 'package:request_manager/routes/name_route.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formLoginEmailKey = GlobalKey<FormState>();

  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoadLogin = false.obs;

  Future<void> login(BuildContext context) async {

    isLoadLogin.value = true;

    if (formLoginEmailKey.currentState!.validate()) {
      var response = await http.post(Uri.parse(baseUrl + AppRoutes.login),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": identifierController.text,
            "password": passwordController.text,
          }));

       if (response.statusCode == 200) {
        // La requête a réussi
        print('Requête POST réussie');
        final responseData = json.decode(response.body);
        final refresh_token = responseData['refresh-token'];
        final rolesUser = responseData['rolesUser'];
        final userId = responseData['userId'];
        final datas = responseData['body'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('refresh_token', refresh_token);
        await prefs.setString('rolesUser', rolesUser);
        await prefs.setString('userId', userId);
        
        isLoadLogin.value = true;
        await Future.delayed(const Duration(seconds: 2));
        context.pushNamed(AppRoutes.home);
        isLoadLogin.value = false;


        return datas;
      }
       else if (response.statusCode == 401) {
         const res = 'revfrty';
       }
       else if (response.statusCode == 403) {
         const res = 'revfrty';
         print('403');
       }

       else {
         print('this is the resp:$response');
       }
    }
    // isLoadLogin.value = true;
    // await Future.delayed(const Duration(seconds: 2));
    // context.pushNamed(AppRoutes.home);
    // isLoadLogin.value = false;
  }
}
