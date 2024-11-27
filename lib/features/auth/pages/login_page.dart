import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/theme.dart';
import 'package:flutter_dashboard/features/share/widgets/primary_text_field_widget.dart';
import 'package:flutter_dashboard/features/dashboard/pages/dashboard_page.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 50),
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/logo/logo.svg', height: 100),
              const SizedBox(height: 35),
              PrimaryTextFieldWidget(
                label: 'Email',
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              PrimaryTextFieldWidget(
                label: 'Password',
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(kcBlue),
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
                ),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, DashboardPage.routeName, (route) => false),
                child: const TextWidget('Login', fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
