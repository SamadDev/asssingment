import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/theme.dart';
import 'package:flutter_dashboard/injectable_config.dart';

import 'core/routes.dart';
import 'features/auth/pages/login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey globalKey = GlobalKey<ScaffoldState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: globalKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: routes,
      initialRoute: LoginPage.routeName,
    );
  }
}
