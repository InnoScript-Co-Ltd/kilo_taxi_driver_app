import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class TripCardDetail extends StatelessWidget {
  const TripCardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppbarWidgets.appBarWidget(context, ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(2, -2),
                    color: Colors.black12,
                    blurRadius: 10)
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/kilo_logo.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Kilo Taxi Service',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey[200],
                        ),
                        const Text(
                          'Office Ph: 09 255022713, 09 255022731,\n09 7909564390, 09 966911116',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[200],
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouteClass.tripCardInvoice);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[100],
                            ),
                            child: Text(
                              'KTS ID - #KTS-139',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Amount to Collect',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${NumberFormat('#,###').format(8500)} MMK",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 16),

                  // Transaction Information
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Transaction Information',
                              style: TextStyle(
                                // fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildTransactionInfo('Initial Cost', '1,500 MMK', ''),
                        _buildTransactionInfo(
                            'Service charge', '+ 300 MMK', ''),
                        _buildTransactionInfo(
                            'Kilo Meter Per charge', '+ 500 MMK', ''),
                        _buildTransactionInfo(
                            '1 x Pre Order', '+ 1,500 MMK', '1 x 500'),
                        _buildTransactionInfo(
                            '1 x Gate Fee', '+ 200 MMK', '1 x 200'),
                        _buildTransactionInfo(
                            '1 x Pet', '+ 1,000 MMK', '1 x 1000'),
                        const SizedBox(height: 16),
                        Divider(
                          color: Colors.grey[200],
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        // Travel Information
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Travel Information',
                              style: TextStyle(
                                // fontSize: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Map');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/google-map.png',
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'View On Map',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 1.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              _buildTravelInfo(
                                  '11:24',
                                  'No (200), Pyay Road, Kamayut, Tsp',
                                  'Start',
                                  Colors.green),
                              _buildTravelInfo(
                                  '11:38',
                                  'Jawahar Lal Nehru Marg, D-Block',
                                  'Stop - Waiting Time: 10 mins',
                                  PRIMARY_COLOR),
                              _buildTravelInfo(
                                  '12:30',
                                  'Jawahar Lal Nehru Marg, D-Block',
                                  'Finish',
                                  Colors.red),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Travel Summary
                        _buildSummaryRow('Travel Time', '1:06'),
                        _buildSummaryRow('Waiting Time', '0:10'),
                        _buildSummaryRow('Travel Distance', '20.50 km'),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteClass.tripCardInvoice);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Print',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionInfo(String label, String value, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12)),
              Text(count,
                  style: const TextStyle(fontSize: 8, color: Colors.green)),
            ],
          ),
          Text(value,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTravelInfo(
      String time, String location, String note, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: Icon(
              Icons.circle,
              color: Colors.blue,
              size: 10,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    note,
                    style: TextStyle(
                      fontSize: 10,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
