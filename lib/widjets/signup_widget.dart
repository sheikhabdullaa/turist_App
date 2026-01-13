import 'package:flutter/material.dart';
import 'package:turist_app/autj_view/choose_role.dart';
import 'package:turist_app/components/custom_text_field.dart';
import 'package:turist_app/components/inter_text.dart';
import 'package:turist_app/repository/auth_repo.dart';
import 'package:turist_app/utils/app_colors.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  inter(
                    text: 'Full Name',
                    decorationColor: AppColors.grey,
                    fontSize: 14,
                    color: AppColors.black,
                    fw: FontWeight.w400,
                  ),
                  customTextField(
                    hint: 'Alina Zeeshan',
                    icon: Icon(Icons.person_2_outlined, color: AppColors.grey),
                    controller: namecontroller,
                    readOnly: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  inter(
                    text: 'Email Address',
                    decorationColor: AppColors.grey,
                    fontSize: 14,
                    color: AppColors.black,
                    fw: FontWeight.w400,
                  ),
                  customTextField(
                    hint: 'for-example@example.com',
                    icon: Icon(Icons.email_outlined, color: AppColors.grey),
                    controller: emailcontroller,
                    readOnly: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  inter(
                    text: 'Phone Number',
                    decorationColor: AppColors.grey,
                    fontSize: 14,
                    color: AppColors.black,
                    fw: FontWeight.w400,
                  ),
                  customTextField(
                    hint: '+123 456 7890',
                    icon: Icon(Icons.call_outlined, color: AppColors.grey),
                    controller: numbercontroller,
                    readOnly: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  inter(
                    text: 'Password',
                    decorationColor: AppColors.grey,
                    fontSize: 14,
                    color: AppColors.black,
                    fw: FontWeight.w400,
                  ),
                  customTextField(
                    hint: '***********',
                    icon: Icon(Icons.lock_outlined, color: AppColors.grey),
                    controller: passwordcontroller,
                    readOnly: true,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loading
                      ? null
                      : () async {
                          try {
                            await AuthRepo().signup(
                              emailcontroller.text.trim(),
                              passwordcontroller.text.trim(),
                              namecontroller.text.trim()
                            );

                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup Successful"),
                              ),
                            );

                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChooseRole(),
                              ),
                            );
                          } catch (e) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("signout failed")),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueascent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: loading
                      ? const CircularProgressIndicator()
                      : inter(
                          text: 'Signup',
                          fontSize: 16,
                          color: AppColors.white,
                          fw: FontWeight.w500,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
