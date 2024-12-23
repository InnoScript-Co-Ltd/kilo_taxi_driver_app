import 'package:flutter_bloc/flutter_bloc.dart';

class Trip {
  final String time;
  final String startLocation;
  final String endLocation;
  final String fare;
  final String commission;

  Trip({
    required this.time,
    required this.startLocation,
    required this.endLocation,
    required this.fare,
    required this.commission,
  });
}

class TripCubit extends Cubit<List<Trip>> {
  TripCubit()
      : super([
          Trip(
            time: "20 Jan 2024 8:00 AM",
            startLocation: "Yankin",
            endLocation: "North Okkalapa",
            fare: "8,000 MMK",
            commission: "600 MMK",
          ),
          Trip(
            time: "20 Jan 2024 9:00 AM",
            startLocation: "North Okkalapa",
            endLocation: "Botahtaung Pagoda",
            fare: "10,000 MMK",
            commission: "600 MMK",
          ),
        ]);

  void filterTrips(String filter) {
    // Simulate filtering logic if needed
    emit(state);
  }
}
