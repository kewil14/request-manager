import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:request_manager/routes/name_route.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> formLoginEmailKey = GlobalKey<FormState>();

  final TextEditingController identifierController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoadLogin = false.obs;

  Future<void> login(BuildContext context) async {
    if (formLoginEmailKey.currentState!.validate()) {
      isLoadLogin.value = true;
      await Future.delayed(const Duration(seconds: 2));
      context.pushNamed(AppRoutes.home);
      isLoadLogin.value = false;
    }
  }
}
