import 'package:flutter/material.dart';
import 'package:one_room_apt/screen/HomeScreen_sub/SearchBar.dart';
import 'package:one_room_apt/screen/HomeScreen_sub/MapWidget.dart';
import 'package:one_room_apt/screen/HomeScreen_sub/Review_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned.fill(
              child: MapWidget(),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: SearchAppBar(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 600,
              child: ReviewList(),
            ),
          ),
        ],
      ),
    );
  }
}
