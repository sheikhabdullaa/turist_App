import 'package:flutter/material.dart';
import 'package:turist_app/active_trip.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/tourist_dashbord.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class GuiderDashboard extends StatefulWidget {
  const GuiderDashboard({super.key});

  @override
  State<GuiderDashboard> createState() => _GuiderDashboardState();
}

bool isFavorite = false;

class _GuiderDashboardState extends State<GuiderDashboard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: ClipOval(
              child: Image.asset('assets/guider.png', fit: BoxFit.cover),
            ),
          ),
        ),
        title: Center(
          child: popintext(
            text: 'Hello! Michal',
            fontSize: 16,
            color: AppColors.black,
            fw: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  popintext(
                    text: 'Upcoming Trips',
                    fontSize: 24,
                    color: AppColors.black,
                    fw: FontWeight.w600,
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TouristDashbord(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_forward, color: AppColors.black),
                  ),
                ],
              ),
              Card(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/swizerland.png',
                        width: screenWidth * 1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/maria.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.02),
                              inter(
                                text: 'Maria Joe',
                                fontSize: 16,
                                color: AppColors.white,
                                fw: FontWeight.w400,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              inter(
                                text: '2d left',
                                fontSize: 12,
                                color: AppColors.white,
                                fw: FontWeight.w400,
                              ),
                              SizedBox(width: screenWidth * 0.27),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/dropdown.png'),
                              ),
                            ],
                          ),
                          inter(
                            text: 'Swiss Alps, Switzerland',
                            fontSize: 16,
                            color: AppColors.white,
                            fw: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/swizerland1.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          inter(
                            text: 'Switzerland',
                            fontSize: 14,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                          inter(
                            text: '12–15 Jan, 2026',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                          inter(
                            text: '2d left',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                          Container(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/swizerland2.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          inter(
                            text: 'Switzerland',
                            fontSize: 14,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                          inter(
                            text: '12–15 Jan, 2026',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                          inter(
                            text: '2d left',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                          Container(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/swizerland3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 80),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 30,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          inter(
                            text: 'Switzerland',
                            fontSize: 14,
                            color: AppColors.black,
                            fw: FontWeight.w500,
                          ),
                          inter(
                            text: '12–15 Jan, 2026',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                          inter(
                            text: '2d left',
                            fontSize: 12,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    popintext(
                      text: 'Active Trips',
                      fontSize: 24,
                      color: AppColors.black,
                      fw: .w600,
                    ),
                    Image.asset('assets/icon.png'),
                  ],
                ),
              ),

              Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/swizerland3.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/maria.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        inter(
                                          text: 'Planned by ',
                                          fontSize: 10,

                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                        inter(
                                          text: 'Maria Joe ',
                                          fontSize: 10,

                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            inter(
                              text: 'Swiss Alps',
                              fontSize: 16,
                              color: AppColors.black,
                              fw: FontWeight.w600,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            inter(
                              text: '12',
                              fontSize: 14,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                            ),
                          ],
                        ),
                        inter(
                          text: '12–15 Jan, 2026',
                          fontSize: 14,
                          color: AppColors.grey,
                          fw: FontWeight.w400,
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActiveTrip(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueascent,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                inter(
                                  text: 'Join',
                                  fontSize: 12,
                                  color: AppColors.white,
                                  fw: .w500,
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                        Container(height: screenHeight * 0.02),
                      ],
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.01),
                  Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/swiiss.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/maria.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        inter(
                                          text: 'Planned by ',
                                          fontSize: 10,

                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                        inter(
                                          text: 'Maria Joe ',
                                          fontSize: 10,

                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            popintext(
                              text: 'Swiss Alps',
                              fontSize: 16,
                              color: AppColors.black,
                              fw: FontWeight.w600,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            popintext(
                              text: '12',
                              fontSize: 14,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                            ),
                          ],
                        ),
                        popintext(
                          text: '12–15 Jan, 2026',
                          fontSize: 14,
                          color: AppColors.grey,
                          fw: FontWeight.w400,
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActiveTrip(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueascent,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                popintext(
                                  text: 'Join',
                                  fontSize: 12,
                                  color: AppColors.white,
                                  fw: .w500,
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                        Container(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/swizerland3.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/maria.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        inter(
                                          text: 'Planned by ',
                                          fontSize: 10,

                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                        inter(
                                          text: 'Maria Joe ',
                                          fontSize: 10,
                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            popintext(
                              text: 'Swiss Alps',
                              fontSize: 16,
                              color: AppColors.black,
                              fw: FontWeight.w600,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            popintext(
                              text: '12',
                              fontSize: 14,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                            ),
                          ],
                        ),
                        popintext(
                          text: '12–15 Jan, 2026',
                          fontSize: 14,
                          color: AppColors.grey,
                          fw: FontWeight.w400,
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActiveTrip(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueascent,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                popintext(
                                  text: 'Join',
                                  fontSize: 12,
                                  color: AppColors.white,
                                  fw: .w500,
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                        Container(height: screenHeight * 0.02),
                      ],
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.01),
                  Card(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 150,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('assets/swiiss.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/maria.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        inter(
                                          text: 'Planned by ',
                                          fontSize: 10,
                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                        inter(
                                          text: 'Maria Joe ',
                                          fontSize: 10,
                                          color: AppColors.white,
                                          fw: FontWeight.w400,
                                        ),
                                      ],
                                    ),

                                    Expanded(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            popintext(
                              text: 'Swiss Alps',
                              fontSize: 16,
                              color: AppColors.black,
                              fw: FontWeight.w600,
                            ),
                            SizedBox(width: screenWidth * 0.03),
                            popintext(
                              text: '12',
                              fontSize: 14,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                            ),
                          ],
                        ),
                        popintext(
                          text: '12–15 Jan, 2026',
                          fontSize: 14,
                          color: AppColors.grey,
                          fw: FontWeight.w400,
                        ),

                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActiveTrip(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueascent,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                popintext(
                                  text: 'Join',
                                  fontSize: 12,
                                  color: AppColors.white,
                                  fw: .w500,
                                ),
                                SizedBox(width: 6),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ),
                        Container(height: screenHeight * 0.02),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
