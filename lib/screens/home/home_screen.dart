import 'package:flutter/material.dart';
import 'package:workshifts/screens/home/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      centerTitle: true,
      // title: Text("Hello"),
      // backgroundColor: ,
    );
  }

  // PreferredSizeWidget newAppBar() {}
}
