import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/core/constants/color.dart';
import 'package:sales_management/core/constants/font.dart';
import 'package:sales_management/presentation/state_management/google/google_bloc.dart';
import 'package:sales_management/presentation/state_management/google/google_event.dart';
import 'package:sales_management/presentation/state_management/google/google_state.dart';
import 'package:sales_management/presentation/widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  // void googleSignIn(StateManager state) async {
  //   await GAuth.signIn().then((value) async {
  //     if (value != null) {
  //       log('Email: ${value.email}');
  //       log('Display Name: ${value.displayName}');
  //       log('Phone Number: ${value.phoneNumber}');
  //
  //       final SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString('uid', value.uid);
  //       await GAuth.saveGoogleCredentials(value);
  //
  //       state.setUser(
  //         UserModel(
  //           uid: value.uid,
  //           name: value.displayName!,
  //           email: value.email!,
  //           phone: value.phoneNumber ?? '',
  //           createdAt: DateTime.now(),
  //           lastLogin: DateTime.now(),
  //         ),
  //       );
  //
  //       if (mounted) Navigator.pushReplacementNamed(context, '/home');
  //     } else {
  //       log('Error signing in with Google');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final state = Provider.of<StateManager>(context);

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
                image: AssetImage('assets/images/login.png'),
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
                          Text('Login', style: TextFontStyle.titleRB),

                          // ~:Subtitle:~
                          Text(
                            'Please sign in to continue.',
                            style: TextFontStyle.subtitleRB,
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
                        child: Text('Sign In', style: TextFontStyle.subtitleRB),
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
                  Text('Or', style: TextFontStyle.moreText),
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
              width: 250,
              height: 50,
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
              child: BlocConsumer<GoogleBloc, GoogleState>(
                listener: (context, state) {
                  if (state is GoogleLoginSuccess) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (state is GoogleLoginFail) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  if (state is GoogleLoginLoading) {
                    return Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      context.read<GoogleBloc>().add(ContinueWithGoogle());
                    },
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextFontStyle.moreText,
                        ),
                      ],
                    ),
                  );
                },
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
                  Text(
                    'Don\'t have an account?',
                    style: TextFontStyle.moreText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: Text('Sign Up', style: TextFontStyle.textButton),
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
