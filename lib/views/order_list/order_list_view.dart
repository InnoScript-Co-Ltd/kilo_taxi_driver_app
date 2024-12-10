import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kilo_driver_app/data/models/order_model.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/viewmodels/order_list_view_model.dart';

class OrderListView extends StatelessWidget {
  final orderListViewModel = OrderListViewModel();
  OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order List'),
          bottom: TabBar(
            dividerHeight: 0.1,
            dividerColor: Colors.grey.shade200,
            indicatorColor: INDIGO_COLOR, // Selected tab underline color
            indicatorWeight: 4.0, // Thickness of the underline
            labelColor: BLACK_COLOR,
            tabs: const [
              Tab(text: 'On Call Order'),
              Tab(text: 'Schedule Order'),
            ],
          ),
        ),
        body: BlocBuilder<OrderListViewModel, List<Order>>(
          bloc: orderListViewModel,
          builder: (context, orders) {
            return TabBarView(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.radio_button_checked,
                                      color: INFO_COLOR,
                                    ),
                                    Container(
                                      width:
                                          2.0, // Thickness of the vertical line
                                      height:
                                          20.0, // Height of the vertical line
                                      color: Colors.grey.shade300,
                                    ),
                                    const Icon(
                                      Icons.radio_button_unchecked,
                                      color: INFO_COLOR,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        orders[index].dropAddress,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        orders[index].pickupAddress,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: GREEN_COLOR,
                            size: 48,
                          )
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteClass.scheduleOrderDetail,
                            arguments: orders[index]);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const Icon(
                                        Icons.radio_button_checked,
                                        color: INFO_COLOR,
                                      ),
                                      Container(
                                        width:
                                            2.0, // Thickness of the vertical line
                                        height:
                                            20.0, // Height of the vertical line
                                        color: Colors.grey.shade300,
                                      ),
                                      const Icon(
                                        Icons.radio_button_unchecked,
                                        color: INFO_COLOR,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          orders[index].dropAddress,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          orders[index].pickupAddress,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 12),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100)),
                                              color: DANGER_COLOR
                                                  .withOpacity(0.1)),
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
                                                DateFormat('dd MMM yyyy')
                                                    .format(orders[index]
                                                            .pickupTime ??
                                                        DateTime.now()),
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: DANGER_COLOR),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: GREEN_COLOR,
                              size: 48,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
