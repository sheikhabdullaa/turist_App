import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final List<Widget> _pages = const [
    TravellerDashbord(),
    ChatBort(),
    TuristProfile(),
    NotificationPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // default pop ko block karega
      onPopInvoked: (didPop) {
        // 🔥 App direct close karega
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: _pages[currentIndex],

        bottomNavigationBar: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// Home
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentIndex == 0 ? Icons.home : Icons.home_outlined,
                      color: currentIndex == 0
                          ? AppColors.deepblue
                          : AppColors.grey,
                    ),
                    popintext(
                      text: 'Home',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: .w400,
                    ),
                  ],
                ),
              ),

              /// Chat Bot
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentIndex == 1
                          ? Icons.smart_toy
                          : Icons.smart_toy_outlined,
                      color: currentIndex == 1
                          ? AppColors.deepblue
                          : AppColors.grey,
                    ),
                    popintext(
                      text: 'Chat Bot',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: .w400,
                    ),
                  ],
                ),
              ),

              /// Profile
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentIndex == 2 ? Icons.person : Icons.person_outline,
                      color: currentIndex == 2
                          ? AppColors.deepblue
                          : AppColors.grey,
                    ),
                    popintext(
                      text: 'Profile',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: .w400,
                    ),
                  ],
                ),
              ),

              /// Chats
              InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentIndex == 3
                          ? Icons.message
                          : Icons.message_outlined,
                      color: currentIndex == 3
                          ? AppColors.deepblue
                          : AppColors.grey,
                    ),
                    popintext(
                      text: 'Chats',
                      fontSize: 12,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
