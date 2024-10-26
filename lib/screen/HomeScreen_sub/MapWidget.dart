import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  NaverMapController? _mapController;

  Future<void> _initializeNaverMap() async {
    await NaverMapSdk.instance.initialize(clientId: '0x5ehrahco');
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeNaverMap(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return NaverMap(
              onMapReady: _onMapReady,
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(37.5893876, 127.0324773),
                  zoom: 15,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _onMapReady(NaverMapController controller) {
    _mapController = controller;
    print("Naver Map is Ready");

    _addMarker('Korea Univ.', NLatLng(37.5893876, 127.0324773));
    _addMarker('City Hall.', NLatLng(36.0239, 127.04832));
  }

  void _addMarker(String id, NLatLng position) {
    final marker = NClusterableMarker(
      id: id,
      position: position,
      caption: NOverlayCaption(text: id),
      iconTintColor: Colors.green[500]!,
    );

    _mapController?.addOverlay(marker);
  }
}