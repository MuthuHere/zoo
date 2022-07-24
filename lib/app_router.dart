import 'package:flutter/material.dart';

import 'entry_success_page.dart';
import 'gate_entry_main_page.dart';
import 'merchant_admin_page.dart';
import 'ticket_admin_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TicketAdminPage.route:
        {
          return MaterialPageRoute(
              builder: (_) => TicketAdminPage(), settings: settings);
        }
      case GateEntryMainPage.route:
        {
          return MaterialPageRoute(
              builder: (_) => GateEntryMainPage(), settings: settings);
        }
      case EntrySuccessPage.route:
        {
          return MaterialPageRoute(
              builder: (_) => EntrySuccessPage(), settings: settings);
        }
      case MerchantAdminPage.route:
        {
          return MaterialPageRoute(
              builder: (_) => MerchantAdminPage(), settings: settings);
        }

      default:
        {
          return MaterialPageRoute(
              builder: (_) => TicketAdminPage(), settings: settings);
        }
    }
  }
}
