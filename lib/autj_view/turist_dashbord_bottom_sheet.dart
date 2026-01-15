import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/chat_bort.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/tourist_dashbord.dart';
import 'package:turist_app/autj_view/turist_profile.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class TuristDashbordBottomSheet extends StatefulWidget {
  const TuristDashbordBottomSheet({super.key});

  @override
  State<TuristDashbordBottomSheet> createState() =>
      _TuristDashbordBottomSheetState();
}

class _TuristDashbordBottomSheetState extends State<TuristDashbordBottomSheet> {
  final List _pages = [
    TouristDashbord(),
    ChatBort(),
    TuristProfile(),
    NotificationPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        color: AppColors.deepblue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  
                  children: [
                    // Image.asset('assets/homeicon.png'),
                    Icon(Icons.home_outlined, color: AppColors.grey),
                    customtext(
                      text: 'Home',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },

              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    // Image.asset('assets/messegeicon.png', color: AppColors.grey),
                    Icon(Icons.smart_toy, color: AppColors.grey),
                    customtext(
                      text: 'Chat Bot',
                      fontSize: 12,
                      color: AppColors.black, 
                      fw: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            
 
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    // Image.asset('assets/personicon.png' , color: AppColors.grey,),
                    Icon(Icons.person_outline, color: AppColors.grey),
                    customtext(
                      text: 'Profile',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    // Image.asset('assets/chat.png'),
                    Icon(Icons.message, color: AppColors.grey),
                    customtext(
                      text: 'Chats',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
