import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/michal_turist_profile.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/model/trip_model.dart';
import 'package:turist_app/repository/creat_trip_repo.dart';
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
              FutureBuilder(
                future: CreatTripRepo().activeTripsGet(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final trip = snapshot.data![index];
                        return Row(
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
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/swizerland3.png',
                                            ),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                    ),
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    'assets/maria.png',
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
                                                    text: trip?.username ?? '',
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
                                        text: trip?.members.toString() ?? '',
                                        fontSize: 14,
                                        color: AppColors.grey,
                                        fw: FontWeight.w400,
                                      ),
                                      Icon(
                                        Icons.person,
                                        size: 14,
                                        color: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                  popintext(
                                    text: trip?.startDate.toString() ?? '',
                                    fontSize: 14,
                                    color: AppColors.grey,
                                    fw: FontWeight.w400,
                                  ),
                                  Row(
                                    children: [
                                      customtext(
                                        text:
                                            trip?.budgetEstimate.toString() ??
                                            '',
                                        fontSize: 16,
                                        color: AppColors.green,
                                        fw: FontWeight.w600,
                                      ),
                                      SizedBox(width: screenWidth * 0.03),
                                      customtext(
                                        text: 'per person',
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
                                          borderRadius: BorderRadius.circular(
                                            17,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                        );
                      },
                    );
                  }

                  return Center(child: Text('No active trips found.'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
