import 'package:flutter/material.dart';
import 'package:turist_app/components/popin_text.dart';

class SarahEditProfile extends StatefulWidget {
  const SarahEditProfile({super.key});

  @override
  State<SarahEditProfile> createState() => _SarahEditProfileState();
}

class _SarahEditProfileState extends State<SarahEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: popintext(text: 'Hello! Sarah Smith', fontSize: 16, color: Colors.black),
      ),
      
      body: Column(
      children: [
        popintext(text: 'Edit Profile Page', fontSize: 20, color: Colors.black),
      ],
    ),);
  }
}