import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turist_app/autj_view/traveller_bottom_sheet.dart';
import 'package:turist_app/autj_view/turist_dashbord_bottom_sheet.dart';
import 'package:turist_app/components/custom_text.dart';
import 'package:turist_app/components/homenaje.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  bool isLoading = false;

  /// 🔹 Save role in Firestore
  Future<void> saveUserRole(String role) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    setState(() => isLoading = true);

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  /// LOGO
                  Image.asset('assets/polygon.png', height: 90),
                  const SizedBox(height: 12),

                  homenage(
                    text: 'Travel Mate',
                    fontSize: 48,
                    color: AppColors.black,
                    fw: FontWeight.w400,
                  ),

                  const SizedBox(height: 24),

                  customtext(
                    text: 'Choose Your Account Type',
                    fontSize: 16,
                    color: AppColors.black,
                    fw: FontWeight.w600,
                  ),

                  const SizedBox(height: 6),

                  popintext(
                    text: 'Select how you want to experience Travel Mate',
                    fontSize: 12,
                    color: AppColors.grey,
                    fw: FontWeight.w300,
                  ),

                  const SizedBox(height: 40),

                  /// ROLE CARDS
                  Row(
                    children: [
                      /// TRAVELER → now pushes to TuristDashbordBottomSheet
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await saveUserRole('traveller');

                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TravellerBottomSheet(),
                              ),
                            );
                          },
                          child: roleCard(
                            image: 'assets/man.png',
                            title: 'Traveler',
                            desc1: 'Explore amazing',
                            desc2: 'destinations and book',
                            desc3: 'unique experiences',
                            screenHeight: screenHeight,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      /// GUIDE → now pushes to TravellerDashbord
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await saveUserRole('guide');

                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const TuristDashbordBottomSheet(),
                              ),
                            );
                          },
                          child: roleCard(
                            image: 'assets/travelguider.png',
                            title: 'Guide',
                            desc1: 'Share your expertise,',
                            desc2: 'showcase your city,',
                            desc3: 'and lead tours',
                            screenHeight: screenHeight,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.15),
                ],
              ),
            ),

            /// LOADING
            if (isLoading)
              Container(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.2),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Card Widget
Widget roleCard({
  required String image,
  required String title,
  required String desc1,
  required String desc2,
  required String desc3,
  required double screenHeight,
}) {
  return Card(
    color: AppColors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueascent,
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          homenage(
            text: title,
            fontSize: 28,
            color: AppColors.black,
            fw: FontWeight.w500,
          ),
          SizedBox(height: screenHeight * 0.03),
          inter(text: desc1, fontSize: 10, color: AppColors.grey),
          inter(text: desc2, fontSize: 10, color: AppColors.grey),
          inter(text: desc3, fontSize: 10, color: AppColors.grey),
        ],
      ),
    ),
  );
}
