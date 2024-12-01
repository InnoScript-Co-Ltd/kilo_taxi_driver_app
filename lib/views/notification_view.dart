import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/viewmodels/notification_view_model.dart';
import '/data/models/notification_model.dart';

class NotificationView extends StatelessWidget {
  final NotificationViewModel notificationViewModel = NotificationViewModel();

  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          bottom: TabBar(
            dividerHeight: 0.1,
            dividerColor: Colors.grey.shade200,
            indicatorColor: INDIGO_COLOR, // Selected tab underline color
            indicatorWeight: 4.0, // Thickness of the underline
            labelColor: BLACK_COLOR,
            tabs: const [
              Tab(text: 'New'),
              Tab(text: 'Ride Updates'),
              Tab(text: 'Payment'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BlocBuilder<NotificationViewModel, List<Noti>>(
              bloc: notificationViewModel,
              builder: (context, notes) {
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: false,
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5EDE8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: notes[index].type == "ride"
                            ? const Icon(Icons.car_rental)
                            : const Icon(Icons.payment),
                      ),
                      title: Text(
                        notes[index].title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C140D)),
                      ),
                      subtitle: Text(
                        notes[index].content,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C734A)),
                      ),
                      trailing: Text(
                        DateFormat('hh:mm a').format(notes[index].dateTime),
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF9C734A)),
                      ),
                      onTap: () {},
                    );
                  },
                );
              },
            ),
            const Center(child: Text('Ride Updates')),
            const Center(child: Text('Payment')),
          ],
        ),
      ),
    );
  }
}
