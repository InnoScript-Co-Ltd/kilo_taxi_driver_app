import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_driver_app/data/models/extra_demand_model.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';

import '../../viewmodels/extra_demand_view_model.dart';

class ExtraDemandsView extends StatelessWidget {
  final ExtraDemandViewModel extraDemandViewModel = ExtraDemandViewModel();

  ExtraDemandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extra Demands'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "OK",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ExtraDemandViewModel, List<ExtraDemand>>(
          bloc: extraDemandViewModel,
          builder: (context, extraDemand) {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade200,
                          width: 2.0), // Add bottom border
                    ),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount (MMK)",
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: BLACK_COLOR),
                      ),
                      Text(
                        "${extraDemandViewModel.totalAmount.toStringAsFixed(0)} MMK ",
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: GREEN_COLOR),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: extraDemand.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade200,
                              width: 1.0), // Add bottom border
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        title: Text(
                          "${extraDemand[index].quantity} x ${extraDemand[index].title}",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: extraDemand[index].quantity > 0
                                ? FontWeight.w500
                                : FontWeight.w400,
                            color: extraDemand[index].quantity > 0
                                ? BLACK_COLOR
                                : BLACK_COLOR.withOpacity(0.4),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${extraDemand[index].price}",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: extraDemand[index].quantity > 0
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                color: extraDemand[index].quantity > 0
                                    ? BLACK_COLOR
                                    : BLACK_COLOR.withOpacity(0.4),
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            MaterialButton(
                              color: DANGER_COLOR.withOpacity(0.2),
                              height: 40.0,
                              minWidth: 40.0,
                              onPressed: () {
                                extraDemandViewModel.decreaseQuantity(index);
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(8.0), // Top-left corner
                                  bottomLeft: Radius.circular(
                                      8.0), // Bottom-left corner
                                ),
                              ),
                              elevation: 0,
                              child: const Icon(
                                Icons.remove,
                                color: DANGER_COLOR,
                              ),
                            ),
                            MaterialButton(
                              height: 40.0,
                              minWidth: 40.0,
                              color: GREEN_COLOR.withOpacity(0.2),
                              onPressed: () {
                                extraDemandViewModel.increaseQuantity(index);
                              },
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(8.0), // Top-left corner
                                  bottomRight: Radius.circular(
                                      8.0), // Bottom-left corner
                                ),
                              ),
                              elevation: 0,
                              child: const Icon(
                                Icons.add,
                                color: GREEN_COLOR,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: PRIMARY_COLOR,
                    height: Dimens.BUTTON_COMMON_HEIGHT,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(100), // Rounded corners
                    ),
                    elevation: 0,
                    child: const Text(
                      'OK',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ));
          }),
    );
  }
}
