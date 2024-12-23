import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';

class CancelSuccessView extends StatelessWidget {
  const CancelSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cancel_success.png',
                  height: 187,
                  width: 187,
                ),
                const SizedBox(
                  height: 48.0,
                ),
                const Text(
                  'Your order has been cancelled',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: BLACK_COLOR),
                )
              ],
            )),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteClass.home);
              },
              color: PRIMARY_COLOR,
              height: Dimens.BUTTON_COMMON_HEIGHT,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100), // Rounded corners
              ),
              elevation: 0,
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
