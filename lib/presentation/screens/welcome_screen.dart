import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/core/constants/color.dart';
import 'package:sales_management/core/constants/font.dart';
import 'package:sales_management/presentation/state_management/carousel/carousel_bloc.dart';
import 'package:sales_management/presentation/state_management/carousel/carousel_event.dart';
import 'package:sales_management/presentation/state_management/carousel/carousel_state.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final state = Provider.of<StateManager>(context);

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
              child: Column(
                children: [
                  // // ~:Image Carousel:~
                  // Expanded(
                  //   child: PageView(
                  //     controller: state.carouselController,
                  //     onPageChanged:
                  //         (value) => state.updateCarouselIndex(value),
                  //     children: [
                  //       Image.asset(
                  //         'assets/images/welcome-2.png',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       Image.asset(
                  //         'assets/images/data.png',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       Image.asset(
                  //         'assets/images/monitor.png',
                  //         fit: BoxFit.contain,
                  //       ),
                  //       Image.asset(
                  //         'assets/images/sales.png',
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                  // // ~:Carousel Indicator:~
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(4, (index) {
                  //     return AnimatedContainer(
                  //       duration: Duration(milliseconds: 300),
                  //       width: state.getCurrentCarouselIndex == index ? 24 : 8,
                  //       height: 5,
                  //       decoration: BoxDecoration(
                  //         color:
                  //             state.getCurrentCarouselIndex == index
                  //                 ? ColorsLibrary.primaryColor1
                  //                 : ColorsLibrary.primaryColor2,
                  //         borderRadius: BorderRadius.circular(20),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey,
                  //             blurRadius: 5,
                  //             spreadRadius: 1,
                  //           ),
                  //         ],
                  //       ),
                  //       margin: EdgeInsets.symmetric(
                  //         vertical: 5.0,
                  //         horizontal: 3.0,
                  //       ),
                  //     );
                  //   }),
                  // ),

                  // ~:Image Carousel:~
                  Expanded(
                    child: BlocBuilder<CarouselBloc, CarouselState>(
                      builder: (context, state) {
                        return PageView(
                          onPageChanged: (value) {
                            // When the page changes, update the current index in the bloc
                            // and notify the listeners.
                            // This will trigger a rebuild of the CarouselIndicator widget
                            // with the new index.
                            context.read<CarouselBloc>().add(
                              CarouselEvent(newIndex: value),
                            );
                          },
                          children: [
                            Image.asset(
                              'assets/images/welcome-2.png',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/images/data.png',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/images/monitor.png',
                              fit: BoxFit.contain,
                            ),
                            Image.asset(
                              'assets/images/sales.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // ~:Carousel Indicator:~
                  BlocBuilder<CarouselBloc, CarouselState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: state.currentIndex == index ? 24 : 8,
                            height: 5,
                            decoration: BoxDecoration(
                              color:
                                  state.currentIndex == index
                                      ? ColorsLibrary.primaryColor1
                                      : ColorsLibrary.primaryColor2,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 3.0,
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ],
              ),
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
                          Text('Figma', style: TextFontStyle.titleRB),

                          // ~:Subtitle:~
                          Text(
                            'We provide you with the best design tools.',
                            style: TextFontStyle.subtitleRB,
                          ),
                        ],
                      ),
                    ),

                    // ~:Call To Action Buttons:~
                    Wrap(
                      runSpacing: 10,
                      children: [
                        // ~:Login Button:~
                        ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            maximumSize: const Size(double.infinity, 80),
                            backgroundColor: ColorsLibrary.primaryColor1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Login',
                            style: TextFontStyle.textfieldPlaceholder,
                          ),
                        ),

                        // ~:Sign Up Button:~
                        ElevatedButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            maximumSize: const Size(double.infinity, 80),
                            backgroundColor: ColorsLibrary.primaryColor2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextFontStyle.textfieldPlaceholder,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
