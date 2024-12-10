import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:latlong2/latlong.dart';

class ScheduleOrderDetailView extends StatefulWidget {
  const ScheduleOrderDetailView({super.key});

  @override
  State<ScheduleOrderDetailView> createState() =>
      _ScheduleOrderDetailViewState();
}

class _ScheduleOrderDetailViewState extends State<ScheduleOrderDetailView> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: DANGER_COLOR.withOpacity(0.1)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: DANGER_COLOR,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      DateFormat('dd MMM yyyy').format(DateTime.now()),
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: DANGER_COLOR),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.radio_button_checked,
                        color: SUCCESS_COLOR,
                      ),
                      Container(
                        width: 2.0, // Thickness of the vertical line
                        height: 20.0, // Height of the vertical line
                        color: Colors.grey.shade300,
                      ),
                      const Icon(
                        Icons.pin_drop_outlined,
                        color: DANGER_COLOR,
                      ),
                    ],
                  ),
                  const SizedBox(width: 12.0),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "No (200), Pyay Road, Kamayut Tsp",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Jawahar Lal Nehru Marg, D-Block",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteClass.acceptOrderDetail);
                  },
                  color: PRIMARY_COLOR,
                  height: Dimens.BUTTON_COMMON_HEIGHT,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // Rounded corners
                  ),
                  elevation: 0,
                  child: const Text(
                    'Accept the Order',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
