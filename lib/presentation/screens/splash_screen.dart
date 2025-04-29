import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/core/constants/color.dart';
import 'package:sales_management/data/repositories/google_login.dart';
import 'package:sales_management/presentation/state_management/google/google_bloc.dart';
import 'package:sales_management/presentation/state_management/google/google_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('user');

  Future<void> onLoad() async {
    // await GAuth.getUserData()
    //     .then((user) async {
    //       if (user != null) {
    //         state.setUser(user);
    //         if (mounted) Navigator.pushReplacementNamed(context, '/home');
    //       } else {
    //         if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
    //       }
    //     })
    //     .catchError((error) {
    //       debugPrint('Error fetching user data: $error');
    //       if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
    //     });

    await GoogleLoginRepoImp()
        .getUserData()
        .then((user) async {
          if (user != null) {
            if (mounted) Navigator.pushReplacementNamed(context, '/home');
          } else {
            if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
          }
        })
        .catchError((error) {
          debugPrint('Error during Google Sign-In: $error');
          if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
        });
  }

  @override
  void initState() {
    super.initState();

    // onLoad(Provider.of<StateManager>(context, listen: false));
    onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if (state is GoogleLoginSuccess) {
          Navigator.pushReplacementNamed(
            context,
            '/home',
            arguments: {'userCreds': state.userModel},
          );
        } else {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
          backgroundColor: ColorsLibrary.primaryColor1,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: ColorsLibrary.primaryColor1,
          child: Wrap(
            spacing: 10,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Image.asset('assets/images/figma.png', width: 200),
              Builder(
                builder: (context) {
                  if (Platform.isIOS) {
                    return SizedBox(
                      width: 30,
                      height: 30,
                      child: CupertinoActivityIndicator(color: Colors.black),
                    );
                  } else {
                    return SizedBox(
                      width: 25,
                      height: 25,
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
