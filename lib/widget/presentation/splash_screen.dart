import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_management/data/management.dart';
import 'package:sales_management/model/user.dart';
import 'package:sales_management/static/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CollectionReference usersCollection = FirebaseFirestore.instance
      .collection('user');

  Future<void> onLoad(Management state) async {
    await Future.delayed(Duration(seconds: 5), () {
      usersCollection.snapshots().listen((res) {
        state.setUser =
            res.docs.isNotEmpty
                ? UserModel.fromJson(res.docs[0].data() as Map<String, dynamic>)
                : UserModel(id: '', name: '', email: '', phoneNumber: '');

        print('User Id: ${state.getUser.id}');
        print('User name: ${state.getUser.name}');
        print('User email: ${state.getUser.email}');
        print('User phone number: ${state.getUser.phoneNumber}');

        if (state.getUser.id.isNotEmpty && state.getUser.id != '') {
          if (mounted) Navigator.pushReplacementNamed(context, '/home');
        } else {
          if (mounted) Navigator.pushReplacementNamed(context, '/welcome');
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onLoad(Provider.of<Management>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image.asset('lib/assets/Figma.png', width: 200),
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
                    child: const CircularProgressIndicator(color: Colors.black),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
