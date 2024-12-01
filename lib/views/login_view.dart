import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/home_view.dart';
import 'package:kilo_driver_app/views/register_view.dart';
import 'package:kilo_driver_app/views/widgets/text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 90,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 4),
                    child: Text("Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  const Text(
                    "Driver",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3.0,
                        color: BLACK_COLOR),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  const TextFieldWidget(labelText: 'Mobile'),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextFieldWidget(
                      labelText: 'Password', obscureText: true),
                  const SizedBox(
                    height: 24,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
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
                      'Next',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "You don’t have an account yet? \nPlease ",
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: BLACK_COLOR,
                            height: 1.5),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: const TextStyle(
                                color: INFO_COLOR,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Powered by Kilo Taxi Service",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Version 1.0",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
