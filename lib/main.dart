import 'package:flutter/material.dart';
import 'package:workshifts/common/constants.dart';
// import 'package:workshifts/common/constants.dart';
import 'package:workshifts/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: ThemeData(
        primaryColor: kPrimaryCol,
        scaffoldBackgroundColor: kBackgroundCol,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextCol),
        visualDensity: VisualDensity.adaptivePlatformDensity,

        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: kPrimaryCol,
          foregroundColor: kBackgroundCol,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
