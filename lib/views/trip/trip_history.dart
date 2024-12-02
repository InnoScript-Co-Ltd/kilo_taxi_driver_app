import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/views/widgets/appbar_widgets.dart';
import 'trip_cubit.dart'; // Import the TripCubit

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  String _selectedFilter = "1 days";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TripCubit(),
      child: Scaffold(
        appBar: AppbarWidgets.appBarWidget(context, "ခရီးစဉ်မှတ်တမ်း"),
        body: Column(
          children: [
            // Date and Filter Section
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "22 Jun 2024",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDaySelectionBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        Text(
                          _selectedFilter,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Trip List Section
            Expanded(
              child: BlocBuilder<TripCubit, List<Trip>>(
                builder: (context, trips) {
                  if (trips.isEmpty) {
                    return const Center(
                      child: Text("No trips available"),
                    );
                  }

                  return ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteClass.tripCardDetail);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      trip.time,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          trip.fare,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Commission - ${trip.commission}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 0.3,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(Icons.radio_button_checked,
                                              color: Colors.grey, size: 20),
                                          Container(
                                            height: 5,
                                            width: 2,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Container(
                                            height: 5,
                                            width: 2,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Container(
                                            height: 5,
                                            width: 2,
                                            color: Colors.grey,
                                          ),
                                          Icon(Icons.location_pin,
                                              color: Colors.red.shade300,
                                              size: 20),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${trip.startLocation}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${trip.endLocation}',
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  size: 20,
                                                  color: Colors.black54,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDaySelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("1 days"),
                onTap: () {
                  _updateFilter("1 days");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("7 days"),
                onTap: () {
                  _updateFilter("7 days");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("30 days"),
                onTap: () {
                  _updateFilter("30 days");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateFilter(String selected) {
    setState(() {
      _selectedFilter = selected;
    });
    // Call your Cubit or any other state management logic here
    // Example: context.read<TripCubit>().filterTrips(_selectedFilter);
  }
}
