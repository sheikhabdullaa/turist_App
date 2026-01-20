import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/chat_bort.dart';
import 'package:turist_app/autj_view/creat_trip.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/tourist_dashbord.dart';
import 'package:turist_app/autj_view/turist_profile.dart';
import 'package:turist_app/utils/app_colors.dart';

class TuristDashbordBottomSheet extends StatefulWidget {
  const TuristDashbordBottomSheet({super.key});

  @override
  State<TuristDashbordBottomSheet> createState() =>
      _TuristDashbordBottomSheetState();
}

class _TuristDashbordBottomSheetState extends State<TuristDashbordBottomSheet> {
  // 🔹 Page controller for PageView
  final PageController _pageController = PageController(initialPage: 0);

  // 🔹 Notch Bottom Bar controller
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  // 🔹 Pages list
  final List<Widget> _pages = const [
    TouristDashbord(),
    ChatBort(),
    CreatTrip(),
    TuristProfile(),
    NotificationPage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // allow notch bar to float over body
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(_pages.length, (index) => _pages[index]),
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: AppColors.deepblue, // background color
        notchColor: AppColors.deepblue, // notch color
        showLabel: true,
        itemLabelStyle: const TextStyle(fontSize: 10),
        maxLine: 1,
        kBottomRadius: 20,
        durationInMilliSeconds: 300,
        bottomBarWidth: MediaQuery.of(context).size.width,
        showShadow: true,
        shadowElevation: 100,
        kIconSize: 28.0,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.home_outlined, color: AppColors.grey),
            activeItem: Icon(Icons.home, color: Colors.black),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.smart_toy, color: AppColors.grey),
            activeItem: Icon(Icons.smart_toy, color: Colors.black),
            itemLabel: 'Chat Bot',
          ),
           BottomBarItem(
            inActiveItem: Icon(Icons.add, color: AppColors.grey),
            activeItem: Icon(Icons.add, color: Colors.black),
            itemLabel: '',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person_outline, color: AppColors.grey),
            activeItem: Icon(Icons.person, color: Colors.black),
            itemLabel: 'Profile',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.notifications_outlined,
              color: AppColors.grey,
            ),
            activeItem: Icon(Icons.notifications, color: Colors.black),
            itemLabel: 'Notifications',
          ),
        ],
        onTap: (index) {
          // update PageView on tap
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
