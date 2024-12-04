import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

class SOSpage extends StatefulWidget {
  const SOSpage({super.key});

  @override
  State<SOSpage> createState() => _SOSpageState();
}

class _SOSpageState extends State<SOSpage> {
  int? _selectedIndex = 0;
  bool confirmStatus = false;
  final TextEditingController _otherReasonController = TextEditingController();

  Future<void> _showMultiSelect() async {
    final List<String> _list = [
      'Medical Emergency',
      'Safety Concerns',
      'Accident or Collision',
      'Mechanical Failure',
      'Other Reason'
    ];

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              scrollable: true,
              title: Row(
                children: [
                  Image.asset(
                    "assets/images/notice.png",
                    width: 30,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Please choose the reason!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(
                      _list.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? Colors.red.shade400
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: _selectedIndex == index
                                    ? Colors.red.shade400
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              _list[index],
                              style: TextStyle(
                                fontSize: 11,
                                color: _selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (_selectedIndex == 4)
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 6),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: _otherReasonController,
                        maxLength: 120,
                        maxLines: 5,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                ],
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      confirmStatus = true;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    confirmStatus
                        ? "Help is on the way!"
                        : "Are you in an emergency?",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    confirmStatus
                        ? "Help is on the way. Please hang on and be patient!"
                        : "Press the button below and help will arrive shortly",
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: _showMultiSelect,
                    child: Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Image.asset(confirmStatus
                          ? 'assets/images/sos2.png'
                          : 'assets/images/sos1.png'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your Current Address',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Near Main Street, North Okkalapa, Yangon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (confirmStatus)
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: () {
                  // Call to Call Center logic
                },
                child: const Text(
                  'Call to Call Center',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
        ],
      ),
    );
  }
}
