import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';

class SplashStepsView extends StatefulWidget {
  const SplashStepsView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashStepsViewState createState() => _SplashStepsViewState();
}

class _SplashStepsViewState extends State<SplashStepsView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/splash_step_1.png",
      "title": "Request Ride",
      "description":
          "Step into a world of hassle-free travel with Kilo Taxi Service. Hail a ride effortlessly, experience the comfort of our fleet, and thrive on convenience. Your journey begins with Kilo Taxi Service – where every mile is a pleasure."
    },
    {
      "image": "assets/images/splash_step_1.png",
      "title": "Confirm Your Driver",
      "description":
          "Embark on a journey of comfort and reliability with Kilo Taxi Service. From easy booking to a fleet designed for your comfort, we redefine your travel experience. Download now and explore the joy of navigating your world in style."
    },
    {
      "image": "assets/images/splash_step_1.png",
      "title": "Track Your Ride",
      "description":
          "Welcome to Kilo Taxi Service, where every ride is an experience in excellence. Step 1: Hail with ease. Step 2: Relax in comfort. Step 3: Arrive with a smile. Join us on this extraordinary journey – your satisfaction, our destination"
    },
  ];

  void _onSkip() {
    // Handle skip action
    // e.g., navigate to home screen
    print("Skip pressed");
  }

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else if (_currentPage == _onboardingData.length - 1) {
      Navigator.pushNamed(context, RouteClass.chooseLanguage);
    } else {
      _onSkip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingSlide(
                  image: _onboardingData[index]['image']!,
                  title: _onboardingData[index]['title']!,
                  description: _onboardingData[index]['description']!,
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Row(
              children: List.generate(
                _onboardingData.length,
                (index) => _buildIndicator(index == _currentPage),
              ),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "Powered by Kilo Taxi Service",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          MaterialButton(
            onPressed: _onNext,
            color: PRIMARY_COLOR,
            height: Dimens.BUTTON_COMMON_HEIGHT,
            minWidth: Dimens.BUTTON_COMMON_HEIGHT,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            elevation: 0,
            child: _currentPage == _onboardingData.length - 1
                ? const Text(
                    'Done',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                : const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 5,
      width: isActive ? 20 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? BLACK_COLOR : GREY_COLOR,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingSlide({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
                child: Image.asset(
              image,
              width: double.infinity,
            )),
          ),
          const SizedBox(height: Dimens.MARGIN_XLARGE),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: Dimens.MARGIN_XLARGE),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: BLACK_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
