import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sales_management/core/constants/color.dart';
import 'package:sales_management/core/constants/font.dart';
import 'package:sales_management/presentation/widgets/custom_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SigUupScreenState();
}

class _SigUupScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorsLibrary.primaryColor2,
        leading: Builder(
          builder: (context) {
            if (Platform.isIOS) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.pop(context),
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 20),
                onPressed: () => Navigator.pop(context),
              );
            }
          },
        ),
      ),
      body: Form(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ColorsLibrary.primaryColor2,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              // ~:Page Image:~
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image(
                  image: AssetImage('assets/images/sign-up.png'),
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ),

              // ~:Page Content:~
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.44,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 8,
                    children: [
                      // ~:Page Topic:~
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            // ~:Title:~
                            Text('Registration', style: TextFontStyle.titleRB),

                            // ~:Subtitle:~
                            Text(
                              'Please create a new account to continue.',
                              style: TextFontStyle.subtitleRB,
                            ),
                          ],
                        ),
                      ),

                      // ~:User Fields:~
                      Column(
                        spacing: 5,
                        children: [
                          // ~:Username TextField:~
                          // CustomTextFormField(
                          //   nameController,
                          //   'your name',
                          //   'Name',
                          //   Icon(Icons.person),
                          //   enableValidator: true,
                          //   validatorType: 'username',
                          // ),

                          // ~:Email TextField:~
                          CustomTextFormField(
                            emailController,
                            'your email',
                            'Email',
                            Icon(Icons.person),
                            enableValidator: true,
                            validatorType: 'email',
                          ),

                          // ~:Password TextField:~
                          CustomTextFormField(
                            passwordController,
                            'your password',
                            'Password',
                            Icon(Icons.lock),
                            isPassword: true,
                            enableValidator: true,
                            validatorType: 'password',
                          ),

                          // ~:Confirm Password TextField:~
                          CustomTextFormField(
                            confirmPasswordController,
                            'your confirm password',
                            'Confirm Password',
                            Icon(Icons.lock),
                            isPassword: true,
                            enableValidator: true,
                            validatorType: 'password',
                          ),
                        ],
                      ),

                      // ~:Submit Button:~
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            log('Email: ${emailController.text}');
                            log('Password: ${passwordController.text}');
                            log(
                              'Confirm Password: ${confirmPasswordController.text}',
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorsLibrary.primaryColor1,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorsLibrary.shadowColor,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                  blurStyle: BlurStyle.normal,
                                ),
                              ],
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextFontStyle.subtitleRB,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ~:Registration Option:~
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextFontStyle.moreText,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text('Login', style: TextFontStyle.textButton),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
