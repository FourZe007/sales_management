import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sales_management/static/color.dart';
import 'package:sales_management/static/font.dart';
import 'package:sales_management/widget/template/custom_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SigUupScreenState();
}

class _SigUupScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 20),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorsLibrary.primaryColor2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ~:Page Image:~
            Expanded(
              child: Image(
                image: AssetImage('lib/assets/sign-up.png'),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),

            // ~:Page Content:~
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    // ~:Page Topic:~
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          // ~:Title:~
                          Text('Registration', style: FontStyle.titleRB),

                          // ~:Subtitle:~
                          Text(
                            'Please create a new account to continue.',
                            style: FontStyle.subtitleRB,
                          ),
                        ],
                      ),
                    ),

                    // ~:User Fields:~
                    Wrap(
                      runSpacing: 5,
                      children: [
                        // ~:Username TextField:~
                        CustomTextFormField(
                          'your name',
                          'Name',
                          Icon(Icons.person),
                          enableValidator: true,
                          validatorType: 'username',
                        ),

                        // ~:Email TextField:~
                        CustomTextFormField(
                          'your email',
                          'Email',
                          Icon(Icons.person),
                          enableValidator: true,
                          validatorType: 'email',
                        ),

                        // ~:Password TextField:~
                        CustomTextFormField(
                          'your password',
                          'Password',
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
                          Navigator.pushNamed(context, '/home');
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
                          child: Text('Sign Up', style: FontStyle.subtitleRB),
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
              height: 40,
              child: Wrap(
                spacing: 5,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  Text('Already have an account?', style: FontStyle.moreText),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Login', style: FontStyle.textButton),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
