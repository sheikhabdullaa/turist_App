import 'package:flutter/material.dart';
import 'package:turist_app/classes/day_classes.dart';
import 'package:turist_app/classes/degree_class.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class RequesttojoinTripDetails extends StatefulWidget {
  const RequesttojoinTripDetails({super.key});

  @override
  State<RequesttojoinTripDetails> createState() =>
      _RequesttojoinTripDetailsState();
}

class _RequesttojoinTripDetailsState extends State<RequesttojoinTripDetails> {
  final dayClass = DayClasses();
  final degreeClass = DegreeClass();

  // ignore: strict_top_level_inference
  get selectedDayIndex => null;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleSpacing: screenWidth * 0.2,
        title: popintext(
          text: 'Trip Details',
          fontSize: 16,
          color: AppColors.black,
          fw: FontWeight.w600,
        ),
        actions: [Icon(Icons.more_vert_outlined)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                                text: 'Planned by ',
                                fontSize: 12,
                                color: AppColors.white,
                                fw: FontWeight.w400,
                              ),

                              SizedBox(width: screenWidth * 0.3),
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/dropdown.png'),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: inter(
                              text: 'Maria Joe',
                              fontSize: 12,
                              color: AppColors.white,
                              fw: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.grey,
                ),

                title: popintext(
                  text: 'Tokyo, Japan',
                  fontSize: 16,
                  color: AppColors.black,
                  fw: FontWeight.w600,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    inter(
                      text: '26℃',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: .w400,
                    ),
                    SizedBox(width: screenheight * 0.01),
                    Icon(Icons.wb_cloudy_outlined, color: AppColors.grey),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_month_outlined),
                title: inter(
                  text: '12–15 March, 2025',
                  fontSize: 14,
                  color: AppColors.grey,
                  fw: FontWeight.w400,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_3_outlined),
                title: inter(
                  text: '4 Members',
                  fontSize: 14,
                  color: AppColors.grey,
                  fw: FontWeight.w400,
                ),
              ),

              SizedBox(height: screenheight * 0.07),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: screenheight * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                        // Join Trip action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueascent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Join Trip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenheight * 0.07),
                  ListTile(
                    leading: popintext(
                      text: 'Members (4)',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: AppColors.blueascent),
                        ),
                        inter(
                          text: 'Add',
                          fontSize: 14,
                          color: AppColors.blueascent,
                          fw: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenheight * 0.01),
                  ListTile(
                    leading: ClipOval(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/maria.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: inter(
                      text: 'Maria Joe',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: inter(
                      text: 'Owner',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: FontWeight.w700,
                    ),
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/michal.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: inter(
                      text: 'Michal',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: inter(
                      text: 'Guide',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: FontWeight.w400,
                    ),
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/sarah.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: inter(
                      text: 'Sarah Smith',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: inter(
                      text: 'Member',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: FontWeight.w400,
                    ),
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/girl.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: inter(
                      text: 'Emma Wilson',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: inter(
                      text: 'Member',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenheight * 0.07),
                  ListTile(
                    leading: popintext(
                      text: 'Expenses',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: AppColors.blueascent),
                        ),
                        inter(
                          text: 'Add',
                          fontSize: 14,
                          color: AppColors.blueascent,
                          fw: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: inter(
                      text: 'Total Spent',
                      fontSize: 16,
                      color: AppColors.grey,
                      fw: FontWeight.w400,
                    ),
                    trailing: popintext(
                      text: '\$715',
                      fontSize: 20,
                      color: AppColors.blueascent,
                      fw: FontWeight.w600,
                    ),
                  ),

                  ListTile(
                    leading: inter(
                      text: 'Per Person',
                      fontSize: 16,
                      color: AppColors.grey,
                      fw: FontWeight.w400,
                    ),
                    trailing: inter(
                      text: '\$178.75',
                      fontSize: 14,
                      color: AppColors.grey,
                      fw: FontWeight.w600,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFBFD8F9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.business),
                    ),
                    title: inter(
                      text: 'Hotel Booking',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: popintext(
                      text: '\$450',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFBFD8F9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.location_on_outlined),
                    ),
                    title: inter(
                      text: 'Transportation',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: popintext(
                      text: '\$85',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFBFD8F9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.room_service_outlined),
                    ),
                    title: inter(
                      text: 'Dinner Restaurant',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w400,
                    ),
                    trailing: popintext(
                      text: '\$180',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenheight * 0.07),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        popintext(
                          text: 'Weather',
                          fontSize: 16,
                          color: AppColors.black,
                          fw: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(83, 191, 216, 249),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.sunny,
                              color: AppColors.blueascent,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Column(
                          children: [
                            popintext(
                              text: '26°C',
                              fontSize: 32,
                              color: AppColors.black,
                              fw: FontWeight.w600,
                            ),
                            inter(
                              text: 'Sunny • Tokyo',
                              fontSize: 14,
                              color: AppColors.grey,
                              fw: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: screenheight * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dayClass.days.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedDayIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: Center(
                                child: Text(
                                  dayClass.days[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset('assets/monday.png'),
                        SizedBox(width: 25),
                        Image.asset('assets/monday.png'),
                        SizedBox(width: 25),
                        Image.asset('assets/wednesday.png'),
                        SizedBox(width: 25),
                        Image.asset('assets/thursday.png'),
                        SizedBox(width: 25),
                        Image.asset('assets/thursday.png'),
                        SizedBox(width: 25),
                        Image.asset('assets/friday.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dayClass.days.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedDayIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: Center(
                                child: Text(
                                  degreeClass.degree[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        popintext(
                          text: 'Group Chat',
                          fontSize: 16,
                          color: AppColors.black,
                          fw: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.messenger_outline_rounded,
                        color: AppColors.white,
                      ),
                    ),
                    title: popintext(
                      text: 'Open Group Chat',
                      fontSize: 16,
                      color: AppColors.black,
                      fw: FontWeight.w600,
                    ),
                    subtitle: inter(
                      text: 'Chat with all trip members here',
                      fontSize: 10,
                      color: AppColors.grey,
                      fw: .w400,
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
