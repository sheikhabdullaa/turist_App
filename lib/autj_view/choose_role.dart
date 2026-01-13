import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/bottom_sheet.dart';
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
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// LOGO & TITLE
              Image.asset('assets/polygon.png', height: 90),
              SizedBox(height: 12),
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
              Row(
                children: [
                  //1st card
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TuristDashbordBottomSheet(),
                            ),
                          );
                        },
                        child: Card(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 30,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.blueascent,
                                    image: DecorationImage(
                                      image: AssetImage('assets/man.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenheight * 0.03),
                                homenage(
                                  text: 'Traveler',
                                  fontSize: 30,
                                  color: AppColors.black,
                                  fw: FontWeight.w500,
                                ),
                                SizedBox(height: screenheight * 0.03),

                                Center(
                                  child: inter(
                                    text: 'Explore amazing ',
                                    fontSize: 10,
                                    color: AppColors.grey,
                                    fw: FontWeight.w200,
                                  ),
                                ),
                                inter(
                                  text: ' destinations and book  ',
                                  fontSize: 10,
                                  color: AppColors.grey,
                                  fw: FontWeight.w200,
                                ),
                                inter(
                                  text: 'unique experiences',
                                  fontSize: 10,
                                  color: AppColors.grey,
                                  fw: FontWeight.w200,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //2nd card
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const guideBottomSheet(),
                          ),
                        );
                      },
                      child: Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 30,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.blueascent,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/travelguider.png',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenheight * 0.03),
                              homenage(
                                text: 'Guide',
                                fontSize: 30,
                                color: AppColors.black,
                                fw: FontWeight.w500,
                              ),
                              SizedBox(height: screenheight * 0.03),

                              Center(
                                child: inter(
                                  text: 'Share your expertise,',
                                  fontSize: 10,
                                  color: AppColors.grey,
                                  fw: FontWeight.w200,
                                ),
                              ),
                              inter(
                                text: '  showcase your city,',
                                fontSize: 10,
                                color: AppColors.grey,
                                fw: FontWeight.w200,
                              ),
                              inter(
                                text: 'and leading tours',
                                fontSize: 10,
                                color: AppColors.grey,
                                fw: FontWeight.w200,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              /// CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TuristDashbordBottomSheet(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueascent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenheight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
