import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/widgets/text_field_widget.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                children: [
                  TextFieldWidget(
                    labelText: "Old Password",
                    hintText: "Enter Old Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  TextFieldWidget(
                    labelText: "New Password",
                    hintText: "Enter New Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),
                  TextFieldWidget(
                    labelText: "Confirm Password",
                    hintText: "Enter Confirm Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            MaterialButton(
              onPressed: () {},
              color: PRIMARY_COLOR,
              height: Dimens.BUTTON_COMMON_HEIGHT,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100), // Rounded corners
              ),
              elevation: 0,
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
