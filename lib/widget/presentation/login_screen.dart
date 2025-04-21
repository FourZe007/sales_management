import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sales_management/auth/google.dart';
import 'package:sales_management/static/color.dart';
import 'package:sales_management/static/font.dart';
import 'package:sales_management/widget/template/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                image: AssetImage('lib/assets/login.png'),
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),

            // ~:Page Content:~
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ~:Page Topic:~
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          // ~:Title:~
                          Text('Login', style: FontStyle.titleRB),

                          // ~:Subtitle:~
                          Text(
                            'Please sign in to continue.',
                            style: FontStyle.subtitleRB,
                          ),
                        ],
                      ),
                    ),

                    // ~:User Fields:~
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Wrap(
                        runSpacing: 5,
                        children: [
                          // ~:Username TextField:~
                          CustomTextFormField(
                            'your username',
                            'Username',
                            Icon(Icons.person),
                            enableValidator: true,
                            validatorType: 'username',
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
                    ),

                    // ~:Submit Button:~
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsLibrary.primaryColor1,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsLibrary.shadowColor,
                              blurRadius: 5,
                              blurStyle: BlurStyle.normal,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text('Sign In', style: FontStyle.subtitleRB),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 25),
                      child: Divider(color: Colors.grey),
                    ),
                  ),
                  Text('Or', style: FontStyle.moreText),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 25, left: 10),
                      child: Divider(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // ~:Alt Login Option:~
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorsLibrary.shadowColor,
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  await GoogleAuth().signIn().then((value) {
                    if (value != null) {
                      print('Email: ${value.email}');
                      print('Display Name: ${value.displayName}');
                      print('Phone Number: ${value.phoneNumber}');
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    } else {
                      print('Error signing in with Google');
                    }
                  });
                },
                child: Wrap(
                  spacing: 5,
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/google.png',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Text('Continue with Google', style: FontStyle.moreText),
                  ],
                ),
              ),
            ),

            // ~:Registration Option:~
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 10),
              child: Wrap(
                spacing: 5,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.end,
                children: [
                  Text('Don\'t have an account?', style: FontStyle.moreText),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('Sign Up', style: FontStyle.textButton),
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
