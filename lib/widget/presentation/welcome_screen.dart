import 'package:flutter/material.dart';
import 'package:sales_management/static/color.dart';
import 'package:sales_management/static/font.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        automaticallyImplyLeading: false,
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
              flex: 2,
              child: Image(image: AssetImage('lib/assets/welcome.png')),
            ),

            // ~:Page Content:~
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    // ~:Page Topic:~
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          // ~:Title:~
                          Text('Figma', style: FontStyle.titleRB),

                          // ~:Subtitle:~
                          Text(
                            'We provide you with the best design tools.',
                            style: FontStyle.subtitleRB,
                          ),
                        ],
                      ),
                    ),

                    // ~:Call To Action Buttons:~
                    Wrap(
                      runSpacing: 10,
                      children: [
                        // ~:Login Button:~
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
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
                              child: Text('Login', style: FontStyle.subtitleRB),
                            ),
                          ),
                        ),

                        // ~:Sign Up Button:~
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorsLibrary.primaryColor2,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: ColorsLibrary.primaryColor3,
                                ),
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
                                style: FontStyle.subtitleRB,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ~:Space for phone navigation bar:~
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
