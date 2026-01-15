import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/michal_turist_profile.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/requesttojoin_trip_details.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
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
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MichalTuristProfile()),
              );
            },
            child: ClipOval(
              child: Image.asset('assets/guider.png', fit: BoxFit.cover),
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
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationPage()),
              );
            },
          ),
        ],
      ),

      // 🔥 IMPORTANT: NO SingleChildScrollView
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

       
          Expanded(
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

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: trips.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.62, 
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final trip = trips[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Stack(
                            children: [
                              Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/swizerland3.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 8,
                                right: 8,
                                child: Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      if (trip == null) return;

                                      setState(() {
                                        trip.isfavorite =
                                            !(trip.isfavorite ?? false);
                                        trip.isnotfavorite =
                                            !(trip.isfavorite ?? true);
                                      });
                                    },
                                    icon: Icon(
                                      (trip?.isfavorite ?? false)
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: (trip?.isfavorite ?? true)
                                          ? Colors.red
                                          : AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    popintext(
                                      text: trip?.location.toString() ?? '',
                                      fontSize: 12,
                                      color: AppColors.black,
                                      fw: FontWeight.w500,
                                    ),
                                    popintext(
                                      text: trip?.members.toString() ?? '',
                                      fontSize: 12,
                                      color: AppColors.grey,
                                      fw: FontWeight.w400,
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      'assets/personicon.png',
                                      color: AppColors.grey,
                                      height: 14,
                                    ),
                                  ],
                                ),

                                
                                inter(
                                  text: trip?.startDate.toString() ?? '',
                                  fontSize: 12,
                                  color: AppColors.grey,
                                  fw: FontWeight.w400,
                                ),

                                
                                Row(
                                  children: [
                                    customtext(
                                      text: trip?.budget.toString() ?? '',
                                      fontSize: 16,
                                      color: AppColors.green,
                                      fw: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 6),
                                    customtext(
                                      text: 'per person',
                                      fontSize: 12,
                                      color: AppColors.grey,
                                      fw: FontWeight.w400,
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  width: double.infinity,
                                  height: 36,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              RequesttojoinTripDetails(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.blueascent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        inter(
                                          text: 'Join',
                                          fontSize: 12,
                                          color: AppColors.white,
                                          fw: FontWeight.w500,
                                        ),
                                        const SizedBox(width: 6),
                                        const Icon(Icons.arrow_forward, color: AppColors.white, size: 16),
                                      ],
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:turist_app/autj_view/michal_turist_profile.dart';
// import 'package:turist_app/autj_view/notification_page.dart';
// import 'package:turist_app/autj_view/requesttojoin_trip_details.dart';
// import 'package:turist_app/components/custom_text.dart';
// import 'package:turist_app/components/popin_text.dart';
// import 'package:turist_app/repository/creat_trip_repo.dart';
// import 'package:turist_app/utils/app_colors.dart';

// class ActiveTrip extends StatefulWidget {
//   const ActiveTrip({super.key});

//   @override
//   State<ActiveTrip> createState() => _ActiveTripState();
// }

// class _ActiveTripState extends State<ActiveTrip> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MichalTuristProfile()),
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
//             color: AppColors.black,
//             fw: FontWeight.w600,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationPage()),
//               );
//             },
//             icon: Icon(Icons.notifications_none_rounded),
//           ),
//         ],
//       ),

//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 25),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   customtext(
//                     text: 'Active Trips',
//                     fontSize: 24,
//                     color: AppColors.black,
//                     fw: FontWeight.w600,
//                   ),
//                   Image.asset('assets/icon.png'),
//                 ],
//               ),
//             ),
//             FutureBuilder(
//               future: CreatTripRepo().activeTripsGet(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text('Something went wrong ${snapshot.error}'),
//                   );
//                 }
//                 if (snapshot.hasData) {
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data?.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                     itemBuilder: (context, index) {
//                       final trip = snapshot.data![index];
//                       return Row(
//                         children: [
//                           Expanded(
//                             child: Card(
//                               // color: AppColors.black,

//                               child: Column(
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Container(
//                                         width: 150,
//                                         height: 120,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(
//                                             10,
//                                           ),
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                               'assets/swizerland3.png',
//                                             ),
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),

//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 10,
//                                           ),
//                                           child: Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,

//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                       horizontal: 10,
//                                                     ),
//                                                 child: ClipOval(
//                                                   child: Image.asset(
//                                                     'assets/maria.png',
//                                                   ),
//                                                 ),
//                                               ),
//                                               Column(
//                                                 children: [
//                                                   customtext(
//                                                     text: 'Planned by ',
//                                                     fontSize: 12,
//                                                     color: AppColors.white,
//                                                     fw: FontWeight.w400,
//                                                   ),
//                                                   customtext(
//                                                     text:
//                                                         trip?.username ?? '',
//                                                     fontSize: 12,
//                                                     color: AppColors.white,
//                                                     fw: FontWeight.w400,
//                                                   ),
//                                                 ],
//                                               ),

//             Expanded(
//               child: IconButton(
//                 onPressed: () {
//                   if (trip == null) return;

//                   setState(() {
//                     trip.isfavorite =
//                         !(trip.isfavorite ??
//                             false);
//                     trip.isnotfavorite =
//                         !(trip.isfavorite ??
//                             true);
//                   });
//                 },
//                 icon: Icon(
//                   (trip?.isfavorite ??
//                           false)
//                       ? Icons.favorite
//                       : Icons
//                             .favorite_outline,
//                   color:
//                       (trip?.isfavorite ??
//                           true)
//                       ? Colors.red
//                       : AppColors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),

//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.start,
//                                     children: [
//                                       popintext(
//                                         text: trip?.location ?? '',
//                                         fontSize: 12,
//                                         color: AppColors.black,
//                                         fw: FontWeight.w400,
//                                       ),
//                                       SizedBox(width: screenWidth * 0.03),
//                                       popintext(
//                                         text: trip?.members.toString() ?? '',
//                                         fontSize: 14,
//                                         color: AppColors.grey,
//                                         fw: FontWeight.w400,
//                                       ),
//                                       Image.asset(
//                                         'assets/personicon.png',
//                                         color: AppColors.grey,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: screenHeight * 0.06),
//                                   popintext(
//                                     text: trip?.startDate.toString() ?? '',
//                                     fontSize: 14,
//                                     color: AppColors.grey,
//                                     fw: FontWeight.w400,
//                                   ),
//                                   Row(
//                                     children: [
//                                       customtext(
//                                         text: trip?.budget.toString() ?? '',
//                                         fontSize: 16,
//                                         color: AppColors.green,
//                                         fw: FontWeight.w600,
//                                       ),
//                                       SizedBox(width: screenWidth * 0.03),
//                                       customtext(
//                                         text: 'per person',
//                                         fontSize: 14,
//                                         color: AppColors.grey,
//                                         fw: FontWeight.w400,
//                                       ),
//                                     ],
//                                   ),
//                                   // SizedBox(height: screenHeight * 0.02),
//                                   SizedBox(
//                                     height: screenHeight * 0.055,
//                                     width: screenWidth * 0.4,
//                                     child: ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 RequesttojoinTripDetails(),
//                                           ),
//                                         );
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: AppColors.blueascent,
//                                         foregroundColor: AppColors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             17,
//                                           ),
//                                         ),
//                                         elevation: 0,
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           popintext(
//                                             text: 'Join',
//                                             fontSize: 12,
//                                             color: AppColors.white,
//                                             fw: .w500,
//                                           ),
//                                           SizedBox(width: 6),
//                                           Icon(Icons.arrow_forward),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   // Container(height: screenHeight * 0.02),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }

//                 return Center(child: Text('No active trips found.'));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }