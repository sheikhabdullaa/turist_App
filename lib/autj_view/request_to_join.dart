import 'package:flutter/material.dart';
import 'package:turist_app/classes/day_classes.dart';
import 'package:turist_app/classes/degree_class.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/practise/watsapp_service.dart';
import 'package:turist_app/repository/creat_trip_repo.dart';
import 'package:turist_app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // ✅ ADDED: WhatsApp open function
  void launchWhatsapp({required String number, required String message}) async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/$number?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('WhatsApp not installed')));
    }
  }

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
        actions: const [Icon(Icons.more_vert_outlined)],
      ),
      body: Expanded(
        child: FutureBuilder(
          future: CreatTripRepo().activeTripsGet(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No active trips found'));
            }

            final trips = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: trips.length,

              itemBuilder: (context, index) {
                final trip = trips[index];

                return Column(
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
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: inter(
                                    text: trip.username.toString(),
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
                      leading: Icon(Icons.location_on_outlined),
                      title: popintext(
                        text: trip.location.toString(),
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
                        text:
                            '${trip.startDate.day} to ${trip.endDate.day}-${trip.endDate.month}-${trip.endDate.year}',
                        fontSize: 14,
                        color: AppColors.grey,
                        fw: FontWeight.w400,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person_3_outlined),
                      title: Row(
                        children: [
                          popintext(
                            text: trip.members.toString(),
                            fontSize: 14,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          inter(
                            text: 'Member',
                            fontSize: 14,
                            color: AppColors.grey,
                            fw: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenheight * 0.07),

                    SizedBox(
                      height: screenheight * 0.065,
                      width: double.infinity,

                      child: ElevatedButton(
                        onPressed: () async {
                          // Optional loader (UX like Foodpanda)
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          await WhatsAppService.openChat(
                            context: context,
                            phone: '923288898341',
                            message: 'Hello! I want to join this trip 😊',
                          );

                          Navigator.pop(context); // close loader
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueascent,
                        ),
                        child: inter(
                          text: 'Join Trip',
                          fontSize: 16,
                          color: AppColors.white,
                          fw: FontWeight.w500,
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
                      leading: ClipOval(child: Image.asset('assets/maria.png')),

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
                      leading: SizedBox(
                        height: 25,
                        width: 25,
                        child: ClipOval(
                          child: Image.asset('assets/michal.png'),
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
                      leading: SizedBox(
                        height: 25,
                        width: 25,
                        child: ClipOval(child: Image.asset('assets/sarah.png')),
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
                      leading: SizedBox(
                        height: 25,
                        width: 25,
                        child: ClipOval(child: Image.asset('assets/girl.png')),
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
                        text: 'Total Expenses',
                        fontSize: 16,
                        color: AppColors.grey,
                        fw: FontWeight.w400,
                      ),
                      trailing: popintext(
                        text: '${trip.totalSpendExpense}',
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
                        text: '${trip.perPersonExpense}',
                        fontSize: 14,
                        color: AppColors.grey,
                        fw: FontWeight.w600,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.business),
                      title: inter(
                        text: 'Hotel Booking',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w400,
                      ),
                      trailing: popintext(
                        text: '${trip.hotelExpense}',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w600,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: inter(
                        text: 'Transportation',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w400,
                      ),
                      trailing: popintext(
                        text: '${trip.transportationExpense}',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w600,
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.room_service_outlined),
                      title: inter(
                        text: 'Dinner Restaurant',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w400,
                      ),
                      trailing: popintext(
                        text: '${trip.dinnerExpense}',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: screenheight * 0.07),

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
                    SizedBox(height: screenheight * 0.02),

                    SizedBox(
                      height: screenheight * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
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
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      height: screenheight * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
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
                    ),

                    ListTile(
                      onTap: () async {
                        // Optional loader for better UX
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );

                        await WhatsAppService.openChat(
                          context: context,
                          phone: '923288898341', // Replace with guider's number
                          message: 'Hello! I want to join the trip 😊',
                        );

                        Navigator.pop(context); // Close loader
                      },
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.messenger_outline_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      title: inter(
                        text: 'Open Chat',
                        fontSize: 16,
                        color: AppColors.black,
                        fw: FontWeight.w600,
                      ),
                      subtitle: inter(
                        text: 'Chat with guider or honour from here',
                        fontSize: 11,
                        color: AppColors.grey,
                        fw: FontWeight.w300,
                      ),
                    ),

                    SizedBox(height: screenheight * 0.13),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
