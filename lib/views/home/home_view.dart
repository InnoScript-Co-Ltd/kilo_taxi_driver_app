import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool autoOn = true;
  List<LatLng> routpoints = [];

  @override
  initState() {
    initRoute();
    super.initState();
  }

  Future<void> initRoute() async {
    const double startLatitude = 16.8261419;
    const double startLongitude = 96.1277288;
    const double destinationLatitude = 16.860652;
    const double destinationLongitude = 96.1199995;

    final Uri url = Uri.parse(
      'http://router.project-osrm.org/route/v1/driving/$startLongitude,$startLatitude;$destinationLongitude,$destinationLatitude?steps=true&annotations=true&geometries=geojson&overview=full',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> coordinates =
            jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];

        setState(() {
          routpoints = coordinates
              .map((coordinate) => LatLng(coordinate[1], coordinate[0]))
              .toList();
        });
      } else {
        throw Exception('Failed to load route: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('Error fetching route: $e');
      routpoints = []; // Ensure routpoints is reset in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        toolbarHeight: 72.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_LARGE),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteClass.profileMenu);
                },
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: INDIGO_COLOR, // Stroke color
                      width: 3, // Stroke width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset('assets/images/user_avatar.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "KTS - 0001",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(16.0)),
                        child: const Text(
                          'kilo +',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "Wallet Balance : ",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                      Text("100,000 MMK",
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons
                .notifications_none), // Trailing icon (e.g., settings icon)
            onPressed: () {
              Navigator.pushNamed(context, RouteClass.notification);
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'OrderList') {
                Navigator.pushNamed(context, RouteClass.orderList);
              }
              if (value == 'OrderAccept') {
                Navigator.pushNamed(context, RouteClass.autoOrderAccept);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: "OrderList",
                  child: Text("Order List"),
                ),
                const PopupMenuItem<String>(
                  value: "OrderAccept",
                  child: Text("Order Accept"),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(16.8261419, 96.1277288),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'com.example.app',
                  ),
                  PolylineLayer(
                    simplificationTolerance: 0.2,
                    polylines: [
                      Polyline(
                          points: routpoints,
                          color: Colors.blue,
                          strokeWidth: 5)
                    ],
                  ),
                  MarkerLayer(markers: [
                    Marker(
                      point: const LatLng(16.8261419, 96.1277288),
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/images/car_marker.png'),
                    ),
                    Marker(
                      point: const LatLng(16.860652, 96.1199995),
                      width: 40,
                      height: 40,
                      child: Image.asset('assets/images/marker.png'),
                    ),
                  ]),
                ]),
            Positioned(
                bottom: 24.0,
                right: 24.0,
                left: 24.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          autoOn = !autoOn;
                        });
                      },
                      color: autoOn ? GREEN_COLOR : DANGER_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      elevation: 0,
                      child: Text(
                        autoOn ? 'Auto On' : 'Auto Off',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteClass.acceptOrderDetail);
                      },
                      color: const Color(0xFF0909C4),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'Instant Ride',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
