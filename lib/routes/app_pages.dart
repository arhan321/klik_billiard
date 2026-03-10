import 'package:flutter/material.dart';
import '../modules/auth/login_view.dart';
import '../modules/auth/register_view.dart';
import '../modules/auth/welcome_view.dart';
import '../modules/user/booking_detail_quick_view.dart';
import '../modules/user/booking_detail_view.dart';
import '../modules/user/booking_view.dart';
import '../modules/user/dashboard_view.dart';
import '../modules/user/history_view.dart';
import '../modules/user/quick_booking_view.dart';
import '../modules/user/tournament_view.dart';
import '../modules/user/voucher_view.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.welcome: (_) => const WelcomeView(),
    AppRoutes.login: (_) => const LoginView(),
    AppRoutes.register: (_) => const RegisterView(),
    AppRoutes.dashboard: (_) => const DashboardView(),
    AppRoutes.voucher: (_) => const VoucherView(),
    AppRoutes.tournament: (_) => const TournamentView(),
    AppRoutes.history: (_) => const HistoryView(),
    AppRoutes.booking: (_) => const BookingView(),
    AppRoutes.quickBooking: (_) => const QuickBookingView(),
    AppRoutes.bookingDetail: (_) => const BookingDetailView(),
    AppRoutes.bookingDetailQuick: (_) => const BookingDetailQuickView(),
  };
}
