import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/home_view.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  String? _selectedOption = "en";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 56,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 44, bottom: 18),
                    child: Text(
                      "Select Language",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: BLACK_COLOR),
                    ),
                  ),
                  const Text(
                    "You can change the language in your profile settings after signing in.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BLACK_COLOR),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    focusColor: null,
                    title: const Text(
                      "English",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: BLACK_COLOR),
                    ),
                    leading: Icon(
                      size: 30,
                      _selectedOption == "en"
                          ? Icons.check_circle
                          : Icons.circle,
                      color:
                          _selectedOption == "en" ? PRIMARY_COLOR : GREY_COLOR,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedOption = "en";
                      });
                    },
                  ),
                  Container(
                    height: 1,
                    color: GREY_COLOR,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "မြန်မာ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: BLACK_COLOR),
                    ),
                    leading: Icon(
                      size: 30,
                      _selectedOption == "mm"
                          ? Icons.check_circle
                          : Icons.circle,
                      color:
                          _selectedOption == "mm" ? PRIMARY_COLOR : GREY_COLOR,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedOption = "mm";
                      });
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
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
                        'Confirm',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
