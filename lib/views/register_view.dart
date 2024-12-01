import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/views/registration_pending_view.dart';
import 'package:kilo_driver_app/views/registration_review_view.dart';
import 'package:kilo_driver_app/views/widgets/dropdown_menu_widget.dart';
import 'package:kilo_driver_app/views/widgets/image_picker_widget.dart';
import 'package:kilo_driver_app/views/widgets/text_field_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Stepper(
          stepIconMargin: const EdgeInsets.all(0),
          type: StepperType.horizontal,
          elevation: 0.5,
          currentStep: _currentStep,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR, // Custom button color
                      padding: const EdgeInsets.symmetric(
                          vertical: 16), // Custom padding
                    ),
                    child: Text(
                      _currentStep == 2
                          ? "Review"
                          : "Next", // Custom button text
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TEXT_COLOR), // Custom font size
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Powered by Kilo Taxi Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep += 1;
              });
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistrationReviewView()),
              );
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: const SizedBox.shrink(),
              content: const DriverInformation(),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
              label: const Text(
                "Driver",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              stepStyle: StepStyle(
                  color: _currentStep > 0 ? SUCCESS_COLOR : PRIMARY_COLOR,
                  connectorColor: GREY_COLOR,
                  indexStyle: const TextStyle(
                      color: BLACK_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
            Step(
              title: const SizedBox.shrink(),
              content: const VehicleInformation(),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
              label: const Text(
                "Vehicle",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              stepStyle: StepStyle(
                  color: _currentStep > 1 ? SUCCESS_COLOR : PRIMARY_COLOR,
                  connectorColor: GREY_COLOR,
                  indexStyle: const TextStyle(
                      color: BLACK_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
            Step(
              title: const SizedBox.shrink(),
              content: const AgreementInformation(),
              isActive: _currentStep >= 2,
              state: StepState.indexed,
              label: const Text(
                "Agreement",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              stepStyle: const StepStyle(
                  color: PRIMARY_COLOR,
                  connectorColor: GREY_COLOR,
                  indexStyle: TextStyle(
                      color: BLACK_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
          ]),
    );
  }
}

class AgreementInformation extends StatefulWidget {
  const AgreementInformation({
    super.key,
  });

  @override
  State<AgreementInformation> createState() => _AgreementInformationState();
}

class _AgreementInformationState extends State<AgreementInformation> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Agreement List",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: BLACK_COLOR),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "(၁) ခရီးသည်နှင့် ဝန်ဆောင်မှုပေးသော အချိန်တွင် ကား လေအေးပေးစက်အား အသုံးပြုပေးနိုင်ပါသလား ?\n\n\n(၂) မိမိကားကို သန့်ရှင်းသပ်ရပ်စွာ ထိန်းသိမ်းပေးနိုင် ပါသလား ?\n\n\n(၃) ခရီးသည်နှင့် စိတ်ရှည်သည်းခံ ယဥ်ကျေးပြူငှာစွာဖြင့် အကောင်းမွန်ဆုံးဝန်ဆောင်မှုပေးနိုင်ပါသလား?\n\n\n(၄) ယာဥ်စည်းကမ်း/လမ်းစည်းကမ်းများကို သိရှိလိုက်နာ ပြီး ဥပဒေနှင့်ညီညွတ်စွာ မောင်းနှင်နိုင်ပါသလား?",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: TEXT_COLOR),
          ),
          const SizedBox(
            height: 16,
          ),
          ListTile(
            horizontalTitleGap: 8,
            contentPadding: EdgeInsets.zero,
            title: const Text(
              "အထက်ဖော်ပြပါအချက်များကို လိုက်နာ ဆောင်ရွက်နိုင်ပါသည်။",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: BLACK_COLOR),
            ),
            leading: Icon(
              size: 30,
              agree ? Icons.check_circle : Icons.circle,
              color: agree ? SUCCESS_COLOR : GREY_COLOR,
            ),
            onTap: () {
              setState(() {
                agree = !agree;
              });
            },
          ),
        ],
      ),
    );
  }
}

class VehicleInformation extends StatefulWidget {
  const VehicleInformation({
    super.key,
  });

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  String? _fuelTypeOption = "octane";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fill Vehicle Information",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: BLACK_COLOR),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Vehicle No.",
            hintText: "Enter Vehicle No.",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Vehicle Type",
            hintText: "Enter Vehicle Type",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Car Model",
            hintText: "Enter Car Model",
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              ImagePickerWidget(
                title: 'Business License Image',
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImagePickerWidget(
                title: 'Vehicle License (front)',
              ),
              SizedBox(
                width: 16,
              ),
              ImagePickerWidget(
                title: 'Vehicle License (back)',
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Fuel Type",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: BLACK_COLOR),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Octane",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    _fuelTypeOption == "octane"
                        ? Icons.check_circle
                        : Icons.circle,
                    color: _fuelTypeOption == "octane"
                        ? SUCCESS_COLOR
                        : GREY_COLOR,
                  ),
                  onTap: () {
                    setState(() {
                      _fuelTypeOption = "octane";
                    });
                  },
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Diesel",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    _fuelTypeOption == "diesel"
                        ? Icons.check_circle
                        : Icons.circle,
                    color: _fuelTypeOption == "diesel"
                        ? SUCCESS_COLOR
                        : GREY_COLOR,
                  ),
                  onTap: () {
                    setState(() {
                      _fuelTypeOption = "diesel";
                    });
                  },
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "EV",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    _fuelTypeOption == "ev" ? Icons.check_circle : Icons.circle,
                    color: _fuelTypeOption == "ev" ? SUCCESS_COLOR : GREY_COLOR,
                  ),
                  onTap: () {
                    setState(() {
                      _fuelTypeOption = "ev";
                    });
                  },
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class DriverInformation extends StatefulWidget {
  const DriverInformation({
    super.key,
  });

  @override
  State<DriverInformation> createState() => _DriverInformationState();
}

class _DriverInformationState extends State<DriverInformation> {
  String? _carTypeOption = "own";

  // Initial selected value
  String? idNumber;

  // List of items
  final List<String> idNumberOptions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Fill Driver Information",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: BLACK_COLOR),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 122.0,
                  height: 122.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: INDIGO_COLOR, // Stroke color
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
                      color: INDIGO_COLOR,
                      size: 40.0, // Icon size
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Name",
            hintText: "Enter Driver Name",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Phone",
            hintText: "Enter Driver Phone Number",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Driving License No",
            hintText: "Enter driving license No",
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImagePickerWidget(
                title: 'Driving License (front)',
              ),
              SizedBox(
                width: 16,
              ),
              ImagePickerWidget(
                title: 'Driving License (back)',
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              Expanded(
                  flex: 1,
                  child: DropDownMenuWidget(
                    title: "ID No",
                  )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: DropDownMenuWidget(
                    title: 'Township',
                  )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 1,
                  child: DropDownMenuWidget(
                    title: "Type",
                  )),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            labelText: "Last Number",
            hintText: "123456",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "City",
            hintText: "Enter City",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Township",
            hintText: "Enter Township",
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Address",
            hintText: "Enter Address",
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Car Owner",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    _carTypeOption == "own" ? Icons.check_circle : Icons.circle,
                    color: _carTypeOption == "own" ? SUCCESS_COLOR : GREY_COLOR,
                  ),
                  onTap: () {
                    setState(() {
                      _carTypeOption = "own";
                    });
                  },
                ),
              )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(4.0), // Rounded corners
                ),
                child: ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Rent",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    _carTypeOption == "rent"
                        ? Icons.check_circle
                        : Icons.circle,
                    color:
                        _carTypeOption == "rent" ? SUCCESS_COLOR : GREY_COLOR,
                  ),
                  onTap: () {
                    setState(() {
                      _carTypeOption = "rent";
                    });
                  },
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const TextFieldWidget(
            labelText: "Referral Mobile Number",
            hintText: "Enter Referral Mobile Number",
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
