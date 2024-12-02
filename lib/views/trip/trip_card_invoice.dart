import 'package:flutter/material.dart';

class TripCardInvoice extends StatelessWidget {
  const TripCardInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    // Show SnackBar after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: const Text("Invoice details loaded successfully!"),
      //     action: SnackBarAction(
      //       label: "Close",
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // );
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Invoice print successfully!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text("Close"))
              ],
            );
          });
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, -2),
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Kilo Taxi Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Office Ph: 09 255022713 , 09 255022731,\n09 799965438, 09 966911116",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[200], height: 20),
              // Date and Driver Info
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "20 July 2024",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "12:45 PM",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Driver ID",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "KTS ID - #KTS-139",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[200], height: 20),
              // Transaction Information
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Transaction Information",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildTransactionRow("Order ID", "KTS ID - #KTS-139", ''),
                    _buildTransactionRow("Initial Cost", "1,500 MMK", ''),
                    _buildTransactionRow("Service charge", "+ 300 MMK", ''),
                    _buildTransactionRow(
                        "Kilo Meter Per charge", "+ 500 MMK", ''),
                    _buildTransactionRow("Travel Distance", "+ 600 MMK", ''),
                    _buildTransactionRow(
                        "1 x Pre Order", "+ 500 MMK", '1 x 500'),
                    _buildTransactionRow(
                        "1 x Gate Fee", "+ 200 MMK", '1 x 200'),
                    _buildTransactionRow("1 x Pet", "+ 1,000 MMK", '1 x 1,000'),
                  ],
                ),
              ),
              Divider(color: Colors.grey[200], height: 40),
              // Total Amount
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "8,500 MMK",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey[200], height: 40),
              // Footer Section
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Thank you for your using",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Best Kilo Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionRow(String label, String value, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                count,
                style: const TextStyle(fontSize: 8),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
