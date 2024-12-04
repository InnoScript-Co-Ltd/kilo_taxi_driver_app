import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kilo_driver_app/views/quick_top_up/account_cubit.dart';
import 'package:intl/intl.dart';
import 'package:kilo_driver_app/views/widgets/appbar_widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _selectedFilter = "1 days";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionCubit()..loadTransactions(),
      child: Scaffold(
        appBar: AppbarWidgets.appBarWidget(context, "ငွေစာရင်း"),
        body: Column(
          children: [
            // Header
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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Amount",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Transaction List
            Expanded(
              child: BlocBuilder<TransactionCubit, List<Map<String, String>>>(
                builder: (context, transactions) {
                  if (transactions.isEmpty) {
                    return const Center(
                        child: Text('No transactions available.'));
                  }

                  return ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Container(
                        color: Colors.grey[200],
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transaction["date"] ?? "",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              transaction["time"] ?? "",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              transaction["amount"] ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Footer with Total
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocBuilder<TransactionCubit, List<Map<String, String>>>(
                    builder: (context, transactions) {
                      final totalAmount =
                          context.read<TransactionCubit>().calculateTotal();
                      return Text(
                        '${NumberFormat('#,###').format(totalAmount)} MMK',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ],
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
