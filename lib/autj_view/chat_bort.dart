import 'package:flutter/material.dart';
import 'package:turist_app/components/popin_text.dart';
import 'package:turist_app/utils/app_colors.dart';

class ChatBort extends StatefulWidget {
  const ChatBort({super.key});

  @override
  State<ChatBort> createState() => _ChatBortState();
}

class _ChatBortState extends State<ChatBort> {
  TextEditingController chatcontroller = TextEditingController();
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
          text: 'Chat Bot',
          fontSize: 16,
          color: AppColors.black,
          fw: FontWeight.w600,
        ),
        actions: [Icon(Icons.more_vert_outlined)],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: chatcontroller,
                decoration: InputDecoration(
                  hintText: 'Ask anything',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: screenheight * 0.09,
              width: screenWidth * 0.17,
              decoration: BoxDecoration(
                color: AppColors.blueascent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_upward, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
