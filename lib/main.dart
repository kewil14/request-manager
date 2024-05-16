import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:request_manager/controllers/auth_controller.dart';
import 'package:request_manager/routes/app_route.dart';
import 'package:request_manager/utils/themes/base_theme.dart';
import 'package:request_manager/utils/themes/text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('fr_FR', null);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Get.put(AuthController());

  runApp(const RequestManagerApp());
}

class RequestManagerApp extends StatefulWidget {
  const RequestManagerApp({super.key});

  @override
  State<RequestManagerApp> createState() => _RequestManagerAppState();
}

class _RequestManagerAppState extends State<RequestManagerApp> {
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Prompt", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return GestureDetector(
      onTap: hideKeyboard,
      child: GetMaterialApp.router(
        title: 'Request Manager',
        theme: theme.light(),
        // theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        routeInformationParser: AppNavigation.router.routeInformationParser,
        routerDelegate: AppNavigation.router.routerDelegate,
        routeInformationProvider: AppNavigation.router.routeInformationProvider,
      ),
    );
  }

  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
