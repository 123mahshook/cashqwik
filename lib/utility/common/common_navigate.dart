import 'package:cashqwik/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:cashqwik/screens/splash_screen/splash_screen.dart';
import 'package:cashqwik/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:cashqwik/utility/page_transitions/fade_route.dart';

class CommonNavigate {
  CommonNavigate({required this.parentContext});
  final BuildContext parentContext;
  navigateSplashScreen() {
    Navigator.pushReplacement(parentContext,
        MaterialPageRoute(builder: (context) => const SplashScreen()));
  }

  navigateWelcomeScreen() {
    Navigator.pushReplacement(
        parentContext, FadeRoute(page: const WelcomeScreen()));
  }

  navigateHomeScreen() {
    Navigator.pushReplacement(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(
                  selectedIndex: 0,
                )));
  }

  navigateOrderScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(
                  selectedIndex: 3,
                )));
  }

  navigateHistoryScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(
                  selectedIndex: 1,
                )));
  }

  navigateProfileScreen() {
    Navigator.push(
        parentContext,
        MaterialPageRoute(
            builder: (context) => const BottomNavScreen(
                  selectedIndex: 4,
                )));
  }

  navigateServerError() {
    //ServerErrorDialog(parentContext: parentContext).show();
  }

  navigateNoInternet() {
    //NoInternetDialog(parentContext: parentContext).show();
  }
}
