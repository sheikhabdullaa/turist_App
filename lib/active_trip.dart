import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/michal_turist_profile.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class ActiveTrip extends StatefulWidget {
  const ActiveTrip({super.key});

  @override
  State<ActiveTrip> createState() => _ActiveTripState();
}

class _ActiveTripState extends State<ActiveTrip> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MichalTuristProfile()),
              );
            },
            child: Container(
              child: ClipOval(
                child: Image.asset('assets/guider.png', fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        title: Center(
          child: customtext(
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customtext(
                      text: 'Active Trips',
                      fontSize: 24,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                    Image.asset('assets/icon.png'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    fw: FontWeight.w500,
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
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    fw: FontWeight.w500,
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
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/maria.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          customtext(
                                            text: 'Planned by ',
                                            fontSize: 12,
                                            color: AppColors.white,
                                            fw: FontWeight.w400,
                                          ),
                                          customtext(
                                            text: 'Maria Joe ',
                                            fontSize: 12,
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
                          Row(
                            children: [
                              customtext(
                                text: '\$49.85',
                                fontSize: 16,
                                color: AppColors.green,
                                fw: FontWeight.w600,
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              customtext(
                                text: 'Per person',
                                fontSize: 14,
                                color: AppColors.grey,
                                fw: FontWeight.w400,
                              ),
                            ],
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
                                    fw: FontWeight.w500,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:turist_app/autj_view/michal_turist_profile.dart';
// import 'package:turist_app/autj_view/notification_page.dart';
// import 'package:turist_app/components/custom_text.dart';
// import 'package:turist_app/components/popin_text.dart';
// import 'package:turist_app/utils/app_colors.dart';

// class ActiveTrip extends StatefulWidget {
//   const ActiveTrip({super.key});

//   @override
//   State<ActiveTrip> createState() => _ActiveTripState();
// }

// class _ActiveTripState extends State<ActiveTrip> {
//   final User? user = FirebaseAuth.instance.currentUser;

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;

//     if (user == null) {
//       return const Scaffold(
//         body: Center(child: Text("User not logged in")),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => const MichalTuristProfile()),
//               );
//             },
//             child: ClipOval(
//               child: Image.asset('assets/guider.png', fit: BoxFit.cover),
//             ),
//           ),
//         ),
//         title: Center(
//           child: customtext(
//             text: 'Hello! Michal',
//             fontSize: 16,
//             fw: FontWeight.w600,
//             color: AppColors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none_rounded),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const NotificationPage()),
//               );
//             },
//           ),
//         ],
//       ),

//       /// 🔥 Firestore Stream
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('creattripuser')
//             .where('userId', isEqualTo: user?.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           // ERROR
//           if (snapshot.hasError) {
//             return const Center(child: Text("Something went wrong"));
//           }

//           // LOADING
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           // EMPTY
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text(
//                 "No Active Trips Found",
//                 style: TextStyle(fontSize: 16),
//               ),
//             );
//           }

//           // DATA
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final data =
//                   snapshot.data!.docs[index].data() as Map<String, dynamic>;

//               final String tripName = data['tripName'] ?? 'Unknown Trip';
//               final String plannerName = data['plannerName'] ?? 'Unknown';
//               final String startDate = data['startDate'] ?? '';
//               final String endDate = data['endDate'] ?? '';
//               final num price = data['price'] ?? 0;
//               final String imageUrl = data['imageUrl'] ?? '';

//               // 🔹 Timestamp → Date String (safe)
//               String createdDate = '';
//               if (data['createdAt'] != null && data['createdAt'] is Timestamp) {
//                 final date = (data['createdAt'] as Timestamp).toDate();
//                 createdDate = "${date.day}-${date.month}-${date.year}";
//               }

//               return Card(
//                 margin: const EdgeInsets.only(bottom: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // IMAGE (safe fallback)
//                     Container(
//                       height: 160,
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(16),
//                         ),
//                         image: DecorationImage(
//                           image: imageUrl.isNotEmpty
//                               ? NetworkImage(imageUrl)
//                               : const AssetImage('assets/swizerland3.png')
//                                   as ImageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           popintext(
//                             text: tripName,
//                             fontSize: 18,
//                             fw: FontWeight.w600,
//                             color: AppColors.black,
//                           ),
//                           const SizedBox(height: 6),

//                           customtext(
//                             text: "Planned by $plannerName",
//                             fontSize: 14,
//                             color: AppColors.grey,
//                           ),

//                           customtext(
//                             text: "$startDate – $endDate",
//                             fontSize: 14,
//                             color: AppColors.grey,
//                           ),

//                           // 🔹 Created Date
//                           if (createdDate.isNotEmpty)
//                             customtext(
//                               text: "Created on $createdDate",
//                               fontSize: 12,
//                               color: AppColors.grey,
//                             ),

//                           const SizedBox(height: 6),

//                           customtext(
//                             text: "\$$price per person",
//                             fontSize: 16,
//                             fw: FontWeight.w600,
//                             color: AppColors.green,
//                           ),

//                           const SizedBox(height: 12),

//                           SizedBox(
//                             height: screenHeight * 0.055,
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // JOIN / DETAILS
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.blueascent,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                               ),
//                               child: const Text("Join Trip"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
