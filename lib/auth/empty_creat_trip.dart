import 'package:flutter/material.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class EmptyCreatTrip extends StatefulWidget {
  const EmptyCreatTrip({super.key});

  @override
  State<EmptyCreatTrip> createState() => _EmptyCreatTripState();
}

class _EmptyCreatTripState extends State<EmptyCreatTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: popintext(
              text: 'Only guider or honour can creat trip ',
              fontSize: 14,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
