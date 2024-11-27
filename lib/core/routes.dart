import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/auth/pages/login_page.dart';
import 'package:flutter_dashboard/features/dashboard/pages/dashboard_page.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  LoginPage.routeName: (context) => const LoginPage(),
  DashboardPage.routeName: (context) => const DashboardPage(),
};
