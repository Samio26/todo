
import 'package:flutter/material.dart';
import 'package:todo/feature_tasks/ui/home._screen.dart';
import 'package:todo/onboarding_feature/onboarding_screen.dart';

const onBoardingRoute="/OnBoarding";
const homeScreen="/Home";
final Map<String, WidgetBuilder> routes = {
  onBoardingRoute:((context) =>OnBoardingScreen() ),
  homeScreen:(context) => HomeScreen()
};