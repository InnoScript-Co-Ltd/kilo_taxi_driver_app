import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/views/widgets/appbar_widgets.dart';

class QuickTopUpPage extends StatefulWidget {
  const QuickTopUpPage({super.key});

  @override
  State<QuickTopUpPage> createState() => _QuickTopUpPageState();
}

class _QuickTopUpPageState extends State<QuickTopUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _transactionIdController =
      TextEditingController();
  final TextEditingController _paymentMethodController =
      TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _topupAmountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidgets.appBarWidget(context, 'Quick Top Up'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // _buildTextField(
                      //   label: 'Transaction ID',
                      //   controller: _transactionIdController,
                      //   keyboardType: TextInputType.number,
                      //   size: 30,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Transaction ID is required';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(height: 16),
                      _buildTextField(
                        label: 'Payment Method',
                        controller: _paymentMethodController,
                        size: 30,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Payment Method is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: 'KPay Mobile Number',
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.phone,
                        size: 30,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile Number is required';
                          }
                          if (!RegExp(r'^\d{9,15}$').hasMatch(value)) {
                            return 'Enter a valid mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: 'Topup Amount',
                        controller: _topupAmountController,
                        keyboardType: TextInputType.number,
                        size: 30,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Topup Amount is required';
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) <= 0) {
                            return 'Enter a valid amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        label: 'Note',
                        controller: _noteController,
                        maxLines: 3,
                        validator: (value) => null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      RouteClass.successTopUp,
                      arguments: {
                        'transactionId': _transactionIdController.text,
                        'paymentMethod': _paymentMethodController.text,
                        'mobileNumber': _mobileNumberController.text,
                        'topupAmount': _topupAmountController.text,
                        'note': _noteController.text,
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
    double? size,
  }) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: size,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              validator: validator,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: TEXT_COLOR,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.all(1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
