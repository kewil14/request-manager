import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:request_manager/routes/app_route.dart';
import 'package:request_manager/utils/themes/base_theme.dart';
import 'package:request_manager/utils/themes/text_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
    final brightness = View.of(context).platformDispatcher.platformBrightness;
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
