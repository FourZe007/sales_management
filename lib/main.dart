import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_management/presentation/screens/home_screen.dart';
import 'package:sales_management/presentation/screens/login_screen.dart';
import 'package:sales_management/presentation/screens/signup_screen.dart';
import 'package:sales_management/presentation/screens/splash_screen.dart';
import 'package:sales_management/presentation/screens/welcome_screen.dart';
import 'package:sales_management/presentation/state_management/carousel/carousel_bloc.dart';
import 'package:sales_management/presentation/state_management/google/google_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => StateManager(),
  //     child: const MainApp(),
  //   ),
  // );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CarouselBloc>(create: (context) => CarouselBloc()),
          BlocProvider<GoogleBloc>(create: (context) => GoogleBloc()),
        ],
        child: MaterialApp(
          title: 'Sales Management',
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: const SplashScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const SignUpScreen(),
            '/welcome': (context) => const WelcomeScreen(),
            '/home': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    // PointerDeviceKind.mouse,
  };
}
