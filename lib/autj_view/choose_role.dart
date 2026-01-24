// import 'package:flutter/material.dart';
// import 'package:turist_app/auth/traveller_dashbord.dart';
// import 'package:turist_app/autj_view/bottom_sheet.dart';
// import 'package:turist_app/autj_view/turist_dashbord_bottom_sheet.dart';
// import 'package:turist_app/components/custom_text.dart';
// import 'package:turist_app/components/homenaje.dart';
// import 'package:turist_app/components/inter_text.dart';
// import 'package:turist_app/components/popin_text.dart';
// import 'package:turist_app/utils/app_colors.dart';

// class ChooseRole extends StatefulWidget {
//   const ChooseRole({super.key});

//   @override
//   State<ChooseRole> createState() => _ChooseRoleState();
// }

// class _ChooseRoleState extends State<ChooseRole> {
//   @override
//   Widget build(BuildContext context) {
//     final screenheight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             children: [
//               const SizedBox(height: 40),

//               /// LOGO & TITLE
//               Image.asset('assets/polygon.png', height: 90),
//               SizedBox(height: 12),
//               homenage(
//                 text: 'Travel Mate',
//                 fontSize: 48,
//                 color: AppColors.black,
//                 fw: FontWeight.w400,
//               ),

//               const SizedBox(height: 24),

//               customtext(
//                 text: 'Choose Your Account Type',
//                 fontSize: 16,
//                 color: AppColors.black,
//                 fw: FontWeight.w600,
//               ),
//               const SizedBox(height: 6),

//               popintext(
//                 text: 'Select how you want to experience Travel Mate',
//                 fontSize: 12,
//                 color: AppColors.grey,
//                 fw: FontWeight.w300,
//               ),

//               const SizedBox(height: 40),
//               Row(
//                 children: [
//                   //1st card
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {},
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const TravellerDashbord(),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           color: AppColors.white,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 30,
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: AppColors.blueascent,
//                                     image: DecorationImage(
//                                       image: AssetImage('assets/man.png'),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height: screenheight * 0.03),
//                                 homenage(
//                                   text: 'Traveler',
//                                   fontSize: 30,
//                                   color: AppColors.black,
//                                   fw: FontWeight.w500,
//                                 ),
//                                 SizedBox(height: screenheight * 0.03),

//                                 Center(
//                                   child: inter(
//                                     text: 'Explore amazing ',
//                                     fontSize: 10,
//                                     color: AppColors.grey,
//                                     fw: FontWeight.w200,
//                                   ),
//                                 ),
//                                 inter(
//                                   text: ' destinations and book  ',
//                                   fontSize: 10,
//                                   color: AppColors.grey,
//                                   fw: FontWeight.w200,
//                                 ),
//                                 inter(
//                                   text: 'unique experiences',
//                                   fontSize: 10,
//                                   color: AppColors.grey,
//                                   fw: FontWeight.w200,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   //2nd card
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const TuristDashbordBottomSheet(),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         color: AppColors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 30,
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: AppColors.blueascent,
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                       'assets/travelguider.png',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: screenheight * 0.03),
//                               homenage(
//                                 text: 'Guide',
//                                 fontSize: 30,
//                                 color: AppColors.black,
//                                 fw: FontWeight.w500,
//                               ),
//                               SizedBox(height: screenheight * 0.03),

//                               Center(
//                                 child: inter(
//                                   text: 'Share your expertise,',
//                                   fontSize: 10,
//                                   color: AppColors.grey,
//                                   fw: FontWeight.w200,
//                                 ),
//                               ),
//                               inter(
//                                 text: '  showcase your city,',
//                                 fontSize: 10,
//                                 color: AppColors.grey,
//                                 fw: FontWeight.w200,
//                               ),
//                               inter(
//                                 text: 'and leading tours',
//                                 fontSize: 10,
//                                 color: AppColors.grey,
//                                 fw: FontWeight.w200,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 60),

//               /// CONTINUE BUTTON
//               SizedBox(
//                 width: double.infinity,
//                 height: 48,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const guideBottomSheet(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.blueascent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Continue',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Icon(Icons.arrow_forward, color: Colors.white),
//                     ],
//                   ),
//                 ),
//               ),

//               SizedBox(height: screenheight * 0.1),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
