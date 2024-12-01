import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/notification_model.dart';

class NotificationViewModel extends Cubit<List<Noti>> {
  NotificationViewModel()
      : super([
          Noti(
              id: 1,
              title: 'Upcoming Ride Reminder',
              content:
                  'Your scheduled ride is approaching. ',
              dateTime: DateTime.now(),
              type: "ride"),
          Noti(
              id: 2,
              title: 'Payment Received',
              content:
                  'We have successfully received your payment for the recent transaction. ',
              dateTime: DateTime.now(),
              type: "payment"),
          Noti(
              id: 3,
              title: 'Ride Completed',
              content:
                  'Your recent ride has been successfully completed. ',
              dateTime: DateTime.now(),
              type: "ride"),
          Noti(
              id: 4,
              title: 'Payment Failed',
              content:
                  'There was an issue processing your payment. ',
              dateTime: DateTime.now(),
              type: "payment"),
          Noti(
              id: 5,
              title: 'New Ride Offer',
              content:
                  'Exciting offers await! Book your next ride now and enjoy a 20% discount on your fare.',
              dateTime: DateTime.now(),
              type: "ride"),
        ]);

  void addNoti(Noti noti) {
    state.add(noti);
    emit(List.from(state));
  }

  void updateNoti(int index, Noti noti) {
    state[index] = noti;
    emit(List.from(state));
  }

  void deleteNoti(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}
