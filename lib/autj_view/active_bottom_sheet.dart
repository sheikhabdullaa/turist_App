import 'package:flutter/material.dart';
import 'package:turist_app/active_trip.dart';
import 'package:turist_app/autj_view/chat_bort.dart';
import 'package:turist_app/autj_view/michal_turist_profile.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class ActiveBottomSheet extends StatefulWidget {
  const ActiveBottomSheet({super.key});

  @override
  State<ActiveBottomSheet> createState() => _activeguidebottomsheetState();
}

// ignore: camel_case_types
class _activeguidebottomsheetState extends State<ActiveBottomSheet> {
  final List _pages = [
    ActiveTrip(),
    ChatBort(),
    MichalTuristProfile(),
    NotificationPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      // ignore: sized_box_for_whitespace
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: Column(
                children: [
                  // Image.asset('assets/homeicon.png', color: AppColors.grey),
                   Icon(Icons.home_outlined, color: AppColors.grey),

                  popintext(
                    text: 'Home',
                    fontSize: 12,
                    color: AppColors.black,
                    fw: .w400,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: Column(
                children: [
                  // Image.asset('assets/chat.png', color: AppColors.grey),
                    Icon(Icons.smart_toy, color: AppColors.grey),

                  popintext(
                    text: 'Chat Bot',
                    fontSize: 12,
                    color: AppColors.black,
                    fw: .w400,
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: Column(
                children: [
                  // Image.asset('assets/personicon.png', color: AppColors.grey),
                    Icon(Icons.person_outline, color: AppColors.grey),

                  popintext(
                    text: 'Profile',
                    fontSize: 12,
                    color: AppColors.black,
                    fw: .w400,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child: Column(
                children: [
                  // Image.asset('assets/messegeicon.png', color: AppColors.grey),
                    Icon(Icons.message, color: AppColors.grey),

                  popintext(
                    text: 'Chats',
                    fontSize: 12,
                    color: AppColors.black,
                    fw: .w400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
