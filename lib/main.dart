import 'package:flutter/material.dart';
import 'package:one_room_apt/screen/homescreen.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NaverMapSdk.instance.initialize(clientId: '0x5ehrahco');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}