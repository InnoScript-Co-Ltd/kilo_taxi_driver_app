import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/home/home_view.dart';

class RegistrationPendingView extends StatelessWidget {
  const RegistrationPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: Dimens.MARGIN_XXXXLARGE),
                child: Text(
                  "Driver registration process\nis pending.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 122.0,
                    height: 122.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/user.jpeg'),
                      ),
                      border: Border.all(
                        color: SUCCESS_COLOR, // Stroke color
                        width: 5, // Stroke width
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Icon(
                        Icons.check_circle_rounded, // Success icon
                        color: SUCCESS_COLOR,
                        size: 40.0, // Icon size
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOR.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM_2),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "In order to complete the registration process. Please contact to Best Kilo Taxi operation service phone ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "099888123",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: INFO_COLOR,
                            decoration: TextDecoration.underline),
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
                  'Ok',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
