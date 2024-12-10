import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_driver_app/data/models/order_model.dart';

class OrderListViewModel extends Cubit<List<Order>> {
  OrderListViewModel()
      : super([
          Order(
              id: 1,
              pickupAddress: "No (200), Pyay Road, Kamayut Tsp",
              dropAddress: "Jawahar Lal Nehru Marg, D-Block"),
          Order(
              id: 2,
              pickupAddress: "No (200), Pyay Road, Kamayut Tsp",
              dropAddress: "Jawahar Lal Nehru Marg, D-Block"),
          Order(
              id: 3,
              pickupAddress: "No (200), Pyay Road, Kamayut Tsp",
              dropAddress: "Jawahar Lal Nehru Marg, D-Block"),
          Order(
              id: 4,
              pickupAddress: "No (200), Pyay Road, Kamayut Tsp",
              dropAddress: "Jawahar Lal Nehru Marg, D-Block"),
          Order(
              id: 5,
              pickupAddress: "No (200), Pyay Road, Kamayut Tsp",
              dropAddress: "Jawahar Lal Nehru Marg, D-Block"),
        ]);
}
