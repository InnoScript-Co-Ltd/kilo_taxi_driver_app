import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/theme/resource/dimens.dart';
import 'package:kilo_driver_app/views/profile_detail_view.dart';
import 'package:kilo_driver_app/views/widgets/custom_list_tile_widget.dart';

class ProfileMenuView extends StatelessWidget {
  const ProfileMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.qr_code), // Trailing icon (e.g., settings icon)
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileDetailView(
                          initialIndex: 3,
                        )),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.MARGIN_LARGE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileDetailView(
                              initialIndex: 0,
                            )),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 72.0,
                      height: 72.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: INDIGO_COLOR, // Stroke color
                          width: 3, // Stroke width
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset('assets/images/user_avatar.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "KTS - 0001",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                    color: PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(16.0)),
                                child: const Text(
                                  'kilo +',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "Wallet Balance : ",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text("100,000 MMK",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600))
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      size: 16,
                      Icons.arrow_forward_ios,
                      color: BLACK_COLOR,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet Balance",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "000,000 Points",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      elevation: 0,
                      child: const Text(
                        'Auto On',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cash Balance",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "4,000 MMK",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      size: 16,
                      Icons.arrow_forward_ios,
                      color: BLACK_COLOR,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "ငွေစာရင်း",
                onTap: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Meter Settings",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomListTileWidget(
                title: "ယနေ့ခရီးစဥ်ဈေးနှုန်း",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "ခရီးစဥ်မှတ်တမ်း",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "Wallet မှတ်တမ်း",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "အဖွဲ့ဝင်များစီမံရန်",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "Top-up Summary",
                onTap: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Permissions Settings",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomListTileWidget(
                title: "Change Password",
                onTap: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Others",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: BLACK_COLOR),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomListTileWidget(
                title: "Language",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              CustomListTileWidget(
                title: "About Us",
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
