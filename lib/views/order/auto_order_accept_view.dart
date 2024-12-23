import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:latlong2/latlong.dart';

class AutoOrderAccept extends StatefulWidget {
  const AutoOrderAccept({super.key});

  @override
  State<AutoOrderAccept> createState() => _AutoOrderAcceptState();
}

class _AutoOrderAcceptState extends State<AutoOrderAccept> {
  @override
  void initState() {
    // Trigger the Bottom Sheet after the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      confirmOrderBottomSheet(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leadingWidth: double.infinity,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                "00.00 km",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              )
            ],
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: "0",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                      color: GREEN_COLOR),
                ),
                TextSpan(
                  text: " MMK",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: GREEN_COLOR),
                )
              ])))
        ],
      ),
      body: SafeArea(
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(16.8395368, 95.8518913),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: [
              Marker(
                point: const LatLng(16.8395368, 95.8518913),
                width: 40,
                height: 40,
                child: Image.asset('assets/images/car_marker.png'),
              )
            ]),
          ],
        ),
      ),
    );
  }

  void confirmOrderBottomSheet(BuildContext context) {
    showModalBottomSheet(
       showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Dimens.MARGIN_MEDIUM_2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 116.0,
                height: 116.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: GREEN_COLOR),
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Text(
                "You have match ride to \nAccept",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 46,
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteClass.acceptOrderDetail);
                  },
                  color: GREEN_COLOR,
                  height: Dimens.BUTTON_COMMON_HEIGHT,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  elevation: 0,
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ))
            ],
          ),
        );
      },
    );
  }
}
