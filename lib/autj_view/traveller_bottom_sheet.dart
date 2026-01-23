import 'package:flutter/material.dart';
import 'package:turist_app/auth/traveller_dashbord.dart';
import 'package:turist_app/autj_view/chat_bort.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/turist_profile.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class TravellerBottomSheet extends StatefulWidget {
  const TravellerBottomSheet({super.key});

  @override
  State<TravellerBottomSheet> createState() => _TravellerBottomSheetState();
}

class _TravellerBottomSheetState extends State<TravellerBottomSheet> {
  final List _pages = [
    TravellerDashbord(),
    ChatBort(),
    TuristProfile(),
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
