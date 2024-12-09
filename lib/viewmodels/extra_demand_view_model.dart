import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_driver_app/data/models/extra_demand_model.dart';

class ExtraDemandViewModel extends Cubit<List<ExtraDemand>> {
  ExtraDemandViewModel()
      : super([
          ExtraDemand(title: "Pre Order", price: 500, quantity: 0),
          ExtraDemand(title: 'Gate Fee', price: 200, quantity: 0),
          ExtraDemand(title: 'Parking Fee', price: 500, quantity: 0),
          ExtraDemand(title: "Pet", price: 1000, quantity: 0),
          ExtraDemand(title: 'Next Trip', price: 1500, quantity: 0),
          ExtraDemand(title: 'More People(4+1)', price: 1000, quantity: 0),
          ExtraDemand(title: "Over Weight", price: 1000, quantity: 0),
          ExtraDemand(title: 'Air Port', price: 2000, quantity: 0),
          ExtraDemand(title: 'Highway Bus Station', price: 2000, quantity: 0),
          ExtraDemand(title: "Industry Zone", price: 2000, quantity: 0),
          ExtraDemand(title: 'Thanlyin Bridge', price: 1000, quantity: 0),
          ExtraDemand(title: 'Morning(4AM to 5AM)', price: 2000, quantity: 0),
          ExtraDemand(title: "Morning(5AM to 6AM)", price: 1000, quantity: 0),
          ExtraDemand(title: 'Night(8PM to 9PM)', price: 1000, quantity: 0),
          ExtraDemand(title: 'Night(9PM to 10PM)', price: 2000, quantity: 0),
          ExtraDemand(title: "Night(10PM to 12PM)", price: 3000, quantity: 0),
          ExtraDemand(title: 'Demand', price: 1000, quantity: 0),
        ]);

  void increaseQuantity(int index) {
    final updatedList = List<ExtraDemand>.from(state);
    updatedList[index].quantity++;
    emit(updatedList);
  }

  void decreaseQuantity(int index) {
    final updatedList = List<ExtraDemand>.from(state);
    if (updatedList[index].quantity > 0) {
      updatedList[index].quantity--;
      emit(updatedList);
    }
  }

  double get totalAmount {
    return state.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
