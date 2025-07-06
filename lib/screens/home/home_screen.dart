import 'package:flutter/material.dart';
import 'package:workshifts/screens/home/body.dart';
import 'package:workshifts/screens/home/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeAppBar(), body: Body());
  }
}
