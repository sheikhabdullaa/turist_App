import 'package:flutter/material.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customtext(text: 'Logout', fontSize: 22, color: AppColors.black),
      ),
      body: Column(children: [
        ],
      ),
    );
  }
}
