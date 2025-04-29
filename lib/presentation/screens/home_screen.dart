import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/core/constants/color.dart';
import 'package:sales_management/presentation/state_management/google/google_bloc.dart';
import 'package:sales_management/presentation/state_management/google/google_event.dart';
import 'package:sales_management/presentation/state_management/google/google_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: ColorsLibrary.primaryColor1,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorsLibrary.primaryColor1,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // ~:Profile & Utilities Section:~
            Container(
              width: MediaQuery.of(context).size.width,
              // color: ColorsLibrary.primaryColor1,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorsLibrary.primaryColor2,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/figma.png',
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  BlocBuilder<GoogleBloc, GoogleState>(
                    builder: (context, state) {
                      User user;
                      if (state is GoogleLoginSuccess) {
                        user = state.userModel;

                        return Text(
                          user.displayName.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                  BlocListener<GoogleBloc, GoogleState>(
                    listener: (context, state) {
                      if (state is GoogleLoggedOut) {
                        Navigator.pushReplacementNamed(context, '/welcome');
                      }
                    },
                    child: IconButton(
                      icon: const Icon(Icons.logout, size: 30),
                      onPressed: () {
                        context.read<GoogleBloc>().add(LogoutWithGoogle());
                      },
                    ),
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
