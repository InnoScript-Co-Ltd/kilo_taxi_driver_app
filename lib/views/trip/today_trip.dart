import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';


class TodayTrip extends StatefulWidget {
  const TodayTrip({super.key});

  @override
  State<TodayTrip> createState() => _TodayTripState();
}

class _TodayTripState extends State<TodayTrip>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ယနေ့ခရီးစဉ်ဈေးနှုန်း'),
          bottom: TabBar(
            controller: _tabController,
            dividerHeight: 0.1,
            dividerColor: Colors.grey.shade200,
            indicatorColor: INDIGO_COLOR, // Selected tab underline color
            indicatorWeight: 4.0, // Thickness of the underline
            labelColor: BLACK_COLOR,
            tabs: const [
              Tab(text: "Config Fee"),
              Tab(text: "Extra Demand Fee"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildConfigFeeList(),
            _buildExtraDemandFeeList(),
          ],
        ));
  }

  Widget _buildConfigFeeList() {
    final List<Map<String, String>> feeData = [
      {"demand": "Initial Fee", "amount": "1,500"},
      {"demand": "Service Charge (Under 5000)", "amount": "300"},
      {"demand": "Service Charge (Over 5000)", "amount": "600"},
      {"demand": "Waiting time charges", "amount": "1,000"},
      {"demand": "Pet", "amount": "1,000"},
      {"demand": "Next Trip", "amount": "1,000"},
      {"demand": "More People (4+1)", "amount": "1,000"},
      {"demand": "Over Weight", "amount": "1,000"},
      {"demand": "Airport", "amount": "1,000"},
      {"demand": "Highway Bus Station", "amount": "1,000"},
      {"demand": "Industry Zone", "amount": "1,000"},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Config Name",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Amount",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feeData.length,
              itemBuilder: (context, index) {
                final fee = feeData[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fee["demand"]!,
                      ),
                      Text(
                        fee["amount"]!,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtraDemandFeeList() {
    final List<Map<String, String>> feeData = [
      {"demand": "Pre Order", "amount": "1,000"},
      {"demand": "Gate Fee", "amount": "1,000"},
      {"demand": "Parking Fee", "amount": "1,000"},
      {"demand": "Pet", "amount": "1,000"},
      {"demand": "Next Trip", "amount": "1,000"},
      {"demand": "More People (4+1)", "amount": "1,000"},
      {"demand": "Over Weight", "amount": "1,000"},
      {"demand": "Airport", "amount": "1,000"},
      {"demand": "Highway Bus Station", "amount": "1,000"},
      {"demand": "Industry Zone", "amount": "1,000"},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Demand Name",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Amount",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: feeData.length,
              itemBuilder: (context, index) {
                final fee = feeData[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fee["demand"]!,
                      ),
                      Text(
                        fee["amount"]!,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
