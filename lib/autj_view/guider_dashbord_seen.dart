import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turist_app/autj_view/edit_trip_screen.dart';
import 'package:turist_app/autj_view/notification_page.dart';
import 'package:turist_app/autj_view/request_to_join.dart';
import 'package:turist_app/autj_view/tourist_dashbord.dart';
import 'package:turist_app/components/custom_text_button.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/model/trip_model.dart';
import 'package:turist_app/repository/creat_trip_repo.dart';
import 'package:turist_app/utils/app_colors.dart';

class GuiderDashbordSeen extends StatefulWidget {
  const GuiderDashbordSeen({super.key});

  @override
  State<GuiderDashbordSeen> createState() => _GuiderDashbordSeenState();
}

class _GuiderDashbordSeenState extends State<GuiderDashbordSeen> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final CreatTripRepo _tripRepo = CreatTripRepo();

  // ------------------ Delete Function ------------------
  Future<void> deleteTrip(String tripId) async {
    try {
      await _tripRepo.deleteTrip(tripId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Trip deleted successfully')),
      );
      setState(() {}); // refresh UI
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error deleting trip: $e')));
    }
  }

  // ------------------ Edit Function ------------------
  void editTrip(Trip trip) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditTripScreen(trip: trip)),
    );

    if (result == true) {
      setState(() {}); // refresh after edit
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset('assets/guider.png', fit: BoxFit.cover),
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
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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
                      fw: FontWeight.w600,
                    ),
                    Image.asset('assets/icon.png'),
                  ],
                ),
              ),

              // ------------------ Active Trips Grid ------------------
              FutureBuilder<List<Trip>>(
                future: _tripRepo.activeTripsGet(),
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

                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {}); // reload FutureBuilder
                    },
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: trips.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.3,
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
                              // Image at top
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  'assets/swizerland3.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 120,
                                ),
                              ),

                              // Trip info
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    popintext(
                                      text: trip.location,
                                      fontSize: 12,
                                      color: AppColors.black,
                                      fw: .w900,
                                    ),
                                    inter(
                                      text:
                                          '${trip.startDate.day}-${trip.startDate.month}-${trip.startDate.year}',
                                      fontSize: 12,
                                      color: AppColors.grey,
                                      fw: FontWeight.w400,
                                    ),
                                    const SizedBox(height: 8),

                                    // Join button
                                    Center(
                                      child: CustomButton(
                                        title: 'Join',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  RequesttojoinTripDetails(),
                                            ),
                                          );
                                        },
                                        bgColor: AppColors.blueascent,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    // ------------------ EDIT & DELETE BUTTONS ------------------
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () => editTrip(trip),
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 18,
                                          ),
                                          label: const Text('Edit'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.blueascent,
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            final confirm = await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                  'Delete Trip',
                                                ),
                                                content: const Text(
                                                  'Are you sure you want to delete this trip?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                          context,
                                                          false,
                                                        ),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                          context,
                                                          true,
                                                        ),
                                                    child: const Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirm == true) {
                                              await deleteTrip(trip.tripId);
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 18,
                                          ),
                                          label: const Text('Delete'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
