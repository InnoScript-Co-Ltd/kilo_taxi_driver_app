import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';

class CancelReasonView extends StatelessWidget {
  const CancelReasonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cancel Reason")),
        body: Stack(
          children: [
            Positioned(
                bottom: 16.0,
                right: 16.0,
                left: 16.0,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8)),
                      child: const TextField(
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10, // Makes the text field a multi-line input
                        decoration: InputDecoration(
                          labelText: "Enter a cancel reason",
                          contentPadding: EdgeInsets.all(16.0),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteClass.cancelSuccess);
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
                        'Submit',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
