import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/registration_pending/registration_pending_view.dart';
import 'package:kilo_driver_app/views/widgets/preview_content_widget.dart';
import 'package:kilo_driver_app/views/widgets/preview_image_widget.dart';

class RegistrationReviewView extends StatefulWidget {
  const RegistrationReviewView({super.key});

  @override
  State<RegistrationReviewView> createState() => _RegistrationReviewViewState();
}

class _RegistrationReviewViewState extends State<RegistrationReviewView> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Review'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Driver Information",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BLACK_COLOR),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 122.0,
                  height: 122.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: INDIGO_COLOR, // Stroke color
                      width: 5, // Stroke width
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/user_avatar.png'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(title: "Name", content: "John Doe"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Phone", content: "98687343121"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Driving License No.", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: PreviewImageWidget(
                            title: "Driving License (front)")),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: PreviewImageWidget(
                            title: "Driving License (back)")),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(title: "NRC No.", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(title: "City", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(title: "Township", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(title: "Address", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Ownership", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Referral Mobile Number", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  color: GREY_COLOR, // Line color
                  thickness: 1.0, // Line thickness
                  indent: 0, // Top space
                  endIndent: 0, // Bottom space
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Vehicle Information",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BLACK_COLOR),
                ),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Vehicle No.", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Vehicle Type", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Car Model", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const PreviewImageWidget(title: "Business License Image"),
                const SizedBox(
                  height: 16,
                ),
                const Row(
                  children: [
                    Expanded(
                        child: PreviewImageWidget(
                            title: "Vehicle License (front)")),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: PreviewImageWidget(
                            title: "Vehicle License (back)")),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const PreviewContentWidget(
                    title: "Fuel Type", content: "xxxxx"),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  color: GREY_COLOR, // Line color
                  thickness: 1.0, // Line thickness
                  indent: 0, // Top space
                  endIndent: 0, // Bottom space
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Agreement List",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BLACK_COLOR),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "(၁) ခရီးသည်နှင့် ဝန်ဆောင်မှုပေးသော အချိန်တွင် ကား လေအေးပေးစက်အား အသုံးပြုပေးနိုင်ပါသလား ?\n\n\n(၂) မိမိကားကို သန့်ရှင်းသပ်ရပ်စွာ ထိန်းသိမ်းပေးနိုင် ပါသလား ?\n\n\n(၃) ခရီးသည်နှင့် စိတ်ရှည်သည်းခံ ယဥ်ကျေးပြူငှာစွာဖြင့် အကောင်းမွန်ဆုံးဝန်ဆောင်မှုပေးနိုင်ပါသလား?\n\n\n(၄) ယာဥ်စည်းကမ်း/လမ်းစည်းကမ်းများကို သိရှိလိုက်နာ ပြီး ဥပဒေနှင့်ညီညွတ်စွာ မောင်းနှင်နိုင်ပါသလား?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: TEXT_COLOR),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListTile(
                  horizontalTitleGap: 8,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "I accept the Terms & Conditions",
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
                const SizedBox(
                  height: 32,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteClass.registrationPending);
                  },
                  color: PRIMARY_COLOR,
                  height: Dimens.BUTTON_COMMON_HEIGHT,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // Rounded corners
                  ),
                  elevation: 0,
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Powered by Kilo Taxi Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )));
  }
}
