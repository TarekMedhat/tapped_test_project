import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tapped_test_project/common/constants/app_theme.dart';
import 'package:tapped_test_project/features/home/presentation/screens/home_screen.dart';

void main() {
  // Hide status bar color on Android devices
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapped Test Project',
      theme: AppTheme.primaryTheme(context),
      builder: (context, widget) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: widget ?? Container());
      },
      home: const HomeScreen(),
    );
  }
}
