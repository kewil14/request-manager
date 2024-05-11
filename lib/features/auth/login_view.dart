import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:request_manager/controllers/auth_controller.dart';
import 'package:request_manager/utils/constant/app_assets.dart';
import 'package:request_manager/utils/constant/app_colors.dart';
import 'package:request_manager/utils/constant/app_size.dart';
import 'package:request_manager/utils/forms/validators.dart';
import 'package:request_manager/widgets/inputs/default_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.mediumMargin(context)),
              Image.asset(
                AppAssets.logo,
                height: AppSizes.smallCardHeight(context),
                // alignment: Alignment.topLeft,
              ),
              SizedBox(height: AppSizes.largeMargin(context)),
              Form(
                key: controller.formLoginEmailKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.mediumPadding(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: AppSizes.largeTextSize(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: AppSizes.smallPadding(context)),
                      Text(
                        "Renseigne ton matricule et ton mot de passe afin de pouvoir avoir accès à tes requêtes et tes ressources a l'écoles", // Description
                        style: TextStyle(
                          fontSize: AppSizes.mediumTextSize(context),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: AppSizes.largeMargin(context)),
                      BaseTextField(
                        labelText: 'Matricule',
                        hintText: 'Entrez votre matricule...',
                        controller: controller.identifierController,
                        validator: Validators.validateEmptyIdentifier,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.person_rounded,
                          size: AppSizes.iconSize(
                              context), // Use AppSizes for icon size
                          // color: AppColors.gray,
                        ),
                      ),
                      SizedBox(height: AppSizes.mediumPadding(context)),
                      BaseTextField(
                        labelText: 'Mot de passe',
                        hintText: 'Entrez votre mot de passe...',
                        isPassword: true,
                        controller: controller.passwordController,
                        validator: Validators.validateEmptyPassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: AppSizes.iconSize(
                              context), // Use AppSizes for icon size
                          // color: AppColors.gray,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility,
                          size: AppSizes.iconSize(
                              context), // Use AppSizes for icon size
                          // color: AppColors.gray,
                        ),
                      ),
                      SizedBox(height: AppSizes.largeMargin(context) * 3),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {
                      //         context.pushNamed(AppRoutes.forgot_password);
                      //       },
                      //       child: Text(
                      //         "Forgot password ?",
                      //         style: TextStyle(
                      //           fontSize: AppSizes.mediumTextSize(context),
                      //           fontWeight: FontWeight.w500,
                      //           color: AppColors.primary,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Obx(
                        () => Container(
                          height: AppSizes.mediumButtonHeight(context),
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.isLoadLogin.value
                                ? null
                                : () async {
                                    if (controller
                                        .formLoginEmailKey.currentState!
                                        .validate()) {
                                      controller.login(context);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.mediumPadding(context)),
                              textStyle: TextStyle(
                                fontSize: AppSizes.mediumTextSize(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: controller.isLoadLogin.value
                                ? SizedBox(
                                    height: AppSizes.iconSize(context),
                                    width: AppSizes.iconSize(context),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      // AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : Text(
                                    'Se connecter',
                                    style: TextStyle(
                                      fontSize:
                                          AppSizes.mediumTextSize(context),
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
