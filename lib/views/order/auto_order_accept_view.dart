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
  String? _drivingState = "arrive";
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
                    // Navigator.pop(context);
                    orderBottomSheet(context);
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

  void orderBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context,
            StateSetter setState /*You can rename this!*/) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(Dimens.MARGIN_MEDIUM_2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL TIME",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "00:00:00",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: BLACK_COLOR,
                          ),
                        ),
                      ],
                    )),
                    const Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WAITING",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "00:00:00",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: BLACK_COLOR,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteClass.extraDemands);
                            },
                            color: PRIMARY_COLOR,
                            height: 40.0,
                            minWidth: double.infinity,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Rounded corners
                            ),
                            elevation: 0,
                            child: const Text(
                              'Demands',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    _drivingState == 'progress'
                        ? const SizedBox()
                        : Expanded(
                            child: MaterialButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteClass.cancelReason);
                              },
                              color: DANGER_COLOR,
                              height: 40.0,
                              minWidth: double.infinity,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Rounded corners
                              ),
                              elevation: 0,
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: _drivingState == 'progress' ? 0.0 : 8.0,
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        onPressed: () {},
                        color: Colors.grey.shade200,
                        height: 40.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        elevation: 0,
                        child: const Text(
                          'O/T',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        onPressed: () {},
                        color: DANGER_COLOR.withOpacity(0.2),
                        height: 40.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        elevation: 0,
                        child: Text(
                          '+Stop',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: _drivingState == 'progress'
                                  ? DANGER_COLOR
                                  : DANGER_COLOR.withOpacity(0.6)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        onPressed: () {
                          setState(() {
                            if (_drivingState == 'arrive') {
                              _drivingState = 'start';
                            } else if (_drivingState == 'start') {
                              _drivingState = 'progress';
                            } else {
                              _drivingState = 'arrive';
                              _showConfirmationDialog(context);
                            }
                          });
                        },
                        color: _drivingState == 'progress'
                            ? DANGER_COLOR
                            : GREEN_COLOR,
                        height: 40.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Rounded corners
                        ),
                        elevation: 0,
                        child: Text(
                          _drivingState == 'arrive'
                              ? 'Arrive'
                              : _drivingState == 'start'
                                  ? 'Start'
                                  : 'Finish',
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      color: PRIMARY_COLOR,
                      height: Dimens.BUTTON_COMMON_HEIGHT,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(100), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'CH1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      height: Dimens.BUTTON_COMMON_HEIGHT,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.shade200, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(100), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'CH2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      height: Dimens.BUTTON_COMMON_HEIGHT,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.shade200, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(100), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'CH3',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      height: Dimens.BUTTON_COMMON_HEIGHT,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.shade200, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(100), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'Main',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 44.0,
                      height: 44.0,
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
                    const SizedBox(
                      width: 16,
                    ),
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KTS - 0001",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "is talking ...",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      size: 30,
                      Icons.mic_none_outlined,
                      color: BLACK_COLOR,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Icon(
                      size: 30,
                      Icons.person_add_alt_1_outlined,
                      color: BLACK_COLOR,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Icon(
                      size: 30,
                      Icons.chat_bubble_outline,
                      color: BLACK_COLOR,
                    )
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(
                    color: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        height: 70.0,
                        minWidth: double.infinity,
                        elevation: 0,
                        child:
                            const Icon(size: 30.0, Icons.camera_alt_outlined),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: MaterialButton(
                        onPressed: () {},
                        color: DANGER_COLOR,
                        height: 70.0,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16.0), // Rounded corners
                        ),
                        elevation: 0,
                        child: const Icon(
                          size: 30.0,
                          Icons.mic_none_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        height: 70.0,
                        minWidth: double.infinity,
                        elevation: 0,
                        child: const Icon(size: 30.0, Icons.map_outlined),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: const Text("Are you sure?"),
          titleTextStyle: const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: BLACK_COLOR),
          content: const Text("Do you want to finish this way?"),
          contentTextStyle: const TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, color: BLACK_COLOR),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User pressed "Cancel"
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: BLACK_COLOR),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User pressed "Confirm"
              },
              child: const Text(
                "Ok",
                style: TextStyle(color: BLACK_COLOR),
              ),
            ),
          ],
        );
      },
    );
  }
}
