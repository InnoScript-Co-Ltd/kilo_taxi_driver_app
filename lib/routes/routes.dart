import 'package:flutter/material.dart';
import 'package:kilo_driver_app/views/change_password/change_password_view.dart';
import 'package:kilo_driver_app/views/home/home_view.dart';
import 'package:kilo_driver_app/views/language/language_view.dart';
import 'package:kilo_driver_app/views/login/login_view.dart';
import 'package:kilo_driver_app/views/member/member_details.dart';
import 'package:kilo_driver_app/views/member/member_manage.dart';
import 'package:kilo_driver_app/views/note_list_view.dart';
import 'package:kilo_driver_app/views/notification/notification_view.dart';
import 'package:kilo_driver_app/views/order/accept_order_detail_view.dart';
import 'package:kilo_driver_app/views/order/auto_order_accept_view.dart';
import 'package:kilo_driver_app/views/order/cancel_reason_view.dart';
import 'package:kilo_driver_app/views/order/cancel_success_view.dart';
import 'package:kilo_driver_app/views/order/extra_demands_view.dart';
import 'package:kilo_driver_app/views/order_list/order_list_view.dart';
import 'package:kilo_driver_app/views/order_list/schedule_order_detail_view.dart';
import 'package:kilo_driver_app/views/profile_detail/profile_detail_view.dart';
import 'package:kilo_driver_app/views/profile_menu/profile_menu_view.dart';
import 'package:kilo_driver_app/views/quick_top_up/account.dart';
import 'package:kilo_driver_app/views/quick_top_up/quick_top_up.dart';
import 'package:kilo_driver_app/views/quick_top_up/success_top_up.dart';
import 'package:kilo_driver_app/views/register/register_view.dart';
import 'package:kilo_driver_app/views/registration_pending/registration_pending_view.dart';
import 'package:kilo_driver_app/views/registration_review/registration_review_view.dart';
import 'package:kilo_driver_app/views/sos/sos.dart';
import 'package:kilo_driver_app/views/splash/splash_steps_view.dart';
import 'package:kilo_driver_app/views/splash/splash_view.dart';
import 'package:kilo_driver_app/views/top_up_summary/top_up_summary.dart';
import 'package:kilo_driver_app/views/trip/today_trip.dart';
import 'package:kilo_driver_app/views/trip/trip_card_detail.dart';
import 'package:kilo_driver_app/views/trip/trip_card_invoice.dart';
import 'package:kilo_driver_app/views/trip/trip_history.dart';
import 'package:kilo_driver_app/views/wallet_history/wallet_history.dart';

class RouteClass {
  static const String home = '/';
  static const String splash = '/splash';
  static const String splashSteps = '/splash-steps';
  static const String register = '/register';
  static const String chooseLanguage = '/choose-language';
  static const String login = '/login';
  static const String changePassword = '/change-password';
  static const String registrationReview = '/registration-review';
  static const String registrationPending = '/registration-pending';
  static const String notification = '/notification';
  static const String profileMenu = '/profile-menu';
  static const String profile = '/profile';

  static const String noteListView = '/noteListView';
  static const String quickTopUp = '/quickTopUp';
  static const String successTopUp = '/successTopUp';
  static const String account = '/account';
  static const String cashBalance = '/cash-balance';
  static const String todayTrip = '/today-trip';
  static const String tripHistory = '/trip-history';
  static const String tripCardDetail = '/trip-car-detail';
  static const String tripCardInvoice = '/trip-card-invoice';
  static const String walletHistory = '/wallet-history';
  static const String memberManage = '/member-manage';
  static const String memberDetail = '/member-detail';
  static const String topUpSummary = '/top-up-summary';
  static const String sos = '/sos';

  static const String autoOrderAccept = "/auto-order-accept";
  static const String acceptOrderDetail = "/accept-order-detail";
  static const String extraDemands = "/extra-demands";
  static const String cancelReason = "/cancel-reason";
  static const String cancelSuccess = "/cancel-success";
  static const String orderList = "/order-list";
  static const String scheduleOrderDetail = "/schedule-order-detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildRoute(const HomeView());
      case splash:
        return _buildRoute(const SplashView());
      case splashSteps:
        return _buildRoute(const SplashStepsView());
      case register:
        return _buildRoute(const RegisterView());
      case chooseLanguage:
        return _buildRoute(const LanguageView());
      case login:
        return _buildRoute(const LoginView());
      case changePassword:
        return _buildRoute(const ChangePasswordView());
      case registrationReview:
        return _buildRoute(const RegistrationReviewView());
      case registrationPending:
        return _buildRoute(const RegistrationPendingView());
      case notification:
        return _buildRoute(NotificationView());
      case profileMenu:
        return _buildRoute(const ProfileMenuView());
      case profile:
        return _buildRoute(
            ProfileDetailView(initialIndex: settings.arguments as int? ?? 0));
      case noteListView:
        return _buildRoute(NoteListView());
      case quickTopUp:
        return _buildRoute(const QuickTopUpPage());
      case successTopUp:
        return _buildRoute(
          const SuccessTopUp(),
          settings: settings,
        );
      case account:
        return _buildRoute(const AccountPage());
      case todayTrip:
        return _buildRoute(const TodayTrip());
      case tripHistory:
        return _buildRoute(const TripHistory());
      case tripCardDetail:
        return _buildRoute(const TripCardDetail());
      case tripCardInvoice:
        return _buildRoute(const TripCardInvoice());
      case walletHistory:
        return _buildRoute(const WalletHistory());
      case memberManage:
        return _buildRoute(const MemberManage());
      case memberDetail:
        return _buildRoute(const MemberDetails());
      case topUpSummary:
        return _buildRoute(const TopUpSummary());
      case sos:
        return _buildRoute(const SOSpage());
      case autoOrderAccept:
        return _buildRoute(const AutoOrderAccept());
      case acceptOrderDetail:
        return _buildRoute(const AcceptOrderDetailView());
      case extraDemands:
        return _buildRoute(ExtraDemandsView());
      case cancelReason:
        return _buildRoute(const CancelReasonView());
      case cancelSuccess:
        return _buildRoute(const CancelSuccessView());
      case orderList:
        return _buildRoute(OrderListView());
      case scheduleOrderDetail:
        return _buildRoute(const ScheduleOrderDetailView());
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

  static MaterialPageRoute _buildRoute(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
