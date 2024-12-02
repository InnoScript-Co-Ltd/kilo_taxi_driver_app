import 'package:flutter/material.dart';
import 'package:kilo_driver_app/views/home_view.dart';
import 'package:kilo_driver_app/views/member%20manange/member_details.dart';
import 'package:kilo_driver_app/views/member%20manange/member_manange.dart';
import 'package:kilo_driver_app/views/note_list_view.dart';
import 'package:kilo_driver_app/views/quick%20top%20up/account.dart';
import 'package:kilo_driver_app/views/quick%20top%20up/quick_top_up.dart';
import 'package:kilo_driver_app/views/quick%20top%20up/success_top_up.dart';
import 'package:kilo_driver_app/views/top%20up%20summary/top_up_summary.dart';
import 'package:kilo_driver_app/views/trip/today_trip.dart';
import 'package:kilo_driver_app/views/trip/trip_card_detail.dart';
import 'package:kilo_driver_app/views/trip/trip_card_invoice.dart';
import 'package:kilo_driver_app/views/trip/trip_history.dart';
import 'package:kilo_driver_app/views/wallet%20history/wallte_history.dart';

class RouteClass {
  static const String homepage = '/';
  static const String noteListView = '/noteListView';
  static const String quickTopUp = '/quickTopUp';
  static const String successTopUp = '/successTopUp';
  static const String account = '/account';
  static const String cashBalence = '/cashBalence';
  static const String todayTrip = '/todayTrip';
  static const String tripHistory = '/tripHistory';
  static const String tripCardDetail = '/tripCardDetail';
  static const String tripCardInvoice = '/tripCardInvoice';

  ///
  static const String walletHistory = '/walletHistory';
  static const String memberManange = '/memberManange';
  static const String memberDetail = '/memberDetail';
  static const String topUpSummary = '/topUpSummary';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case noteListView:
        return MaterialPageRoute(builder: (context) => NoteListView());
      case quickTopUp:
        return MaterialPageRoute(builder: (context) => const QuickTopUpPage());
      case successTopUp:
        return MaterialPageRoute(
          builder: (context) => const SuccessTopUp(),
          settings: settings,
        );
      case account:
        return MaterialPageRoute(builder: (context) => const AccountPage());
      case todayTrip:
        return MaterialPageRoute(builder: (context) => const TodayTrip());
      case tripHistory:
        return MaterialPageRoute(builder: (context) => const TripHistory());
      case tripCardDetail:
        return MaterialPageRoute(builder: (context) => const TripCardDetail());
      case tripCardInvoice:
        return MaterialPageRoute(builder: (context) => const TripCardInvoice());
      case walletHistory:
        return MaterialPageRoute(builder: (context) => const WallteHistory());
      case memberManange:
        return MaterialPageRoute(builder: (context) => const MemberManange());
      case memberDetail:
        return MaterialPageRoute(builder: (context) => const MemberDetails());
      case topUpSummary:
        return MaterialPageRoute(builder: (context) => const TopUpSummary());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "No route defined for ${settings.name}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}
