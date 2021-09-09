import 'package:flutter/material.dart';
import 'package:orchid/api/preferences/user_preferences.dart';
import 'package:orchid/pages/help/open_source_page.dart';
import 'package:orchid/pages/help/privacy_page.dart';
import 'package:orchid/pages/onboarding/onboarding_vpn_permission_page.dart';
import 'package:orchid/pages/onboarding/walkthrough_pages.dart';
import 'package:orchid/pages/settings/advanced_configuration_page.dart';
import 'package:orchid/pages/settings/keygen_page.dart';
import 'package:orchid/pages/keys/keys_page.dart';
import 'package:orchid/pages/settings/manage_config_page.dart';
import 'package:orchid/pages/settings/deleted_accounts_page.dart';
import 'package:orchid/pages/settings/settings_log_page.dart';
import 'package:orchid/pages/settings/settings_page.dart';
import 'account_manager/account_manager_page.dart';
import 'circuit/circuit_page.dart';
import 'help/help_overview.dart';
import 'help/legal_page.dart';
import 'monitoring/traffic_view.dart';

class AppRoutes {
  static const String connect = "/connect";
  static const String settings = "/settings";
  static const String settings_wallet = "/settings/wallet";
  static const String settings_vpn = "/settings/vpn";
  static const String settings_log = "/settings/log";
  static const String settings_dev = "/settings/dev";
  static const String configuration = "/settings/configuration";
  static const String help = "/help";
  static const String help_overview = "/help/overview";
  static const String privacy = "/help/privacy";
  static const String open_source = "/help/open_source";
  static const String legal = "/legal";
  static const String feedback = "/feedback";
  static const String onboarding_walkthrough = "/onboarding/walkthrough";
  static const String onboarding_vpn_permission = "/onboarding/vpn_permission";
  static const String onboarding_link_wallet = "/onboarding/link_wallet";
  static const String onboarding_link_wallet_success =
      "/onboarding/link_wallet/success";
  static const String onboarding_vpn_credentials =
      "/onboarding/vpn_credentials";
  static const String keygen = "/settings/keygen";
  static const String keys = "/settings/keys";
  static const String manage_config = "/settings/manage_config";
  static const String circuit = "/circuit";
  static const String identity = "/identity";
  static const String traffic = "/traffic";
  static const String accounts = "/settings/accounts";
  static const String home = "/";

  static final Map<String, WidgetBuilder> routes = {
    settings: (context) => SettingsPage(),
    settings_log: (context) => SettingsLogPage(),
    configuration: (context) => AdvancedConfigurationPage(),
    help_overview: (context) => HelpOverviewPage(),
    privacy: (context) => PrivacyPage(),
    open_source: (context) => OpenSourcePage(),
    legal: (context) => LegalPage(),
    onboarding_walkthrough: (context) => WalkthroughPages(),
    onboarding_vpn_permission: (context) => OnboardingVPNPermissionPage(),
    keygen: (context) => KeyGenPage(),
    keys: (context) => KeysPage(),
    circuit: (context) => CircuitPage(),
    traffic: (context) => TrafficView(),
    accounts: (context) => AccountsPage(),
    manage_config: (context) => ManageConfigPage(),
    identity: (context) => AccountManagerPage()
  };

  static Future<void> pushAccountManager(BuildContext context) async {
    if (await UserPreferences().guiV0.get()) {
      return await Navigator.pushNamed(context, AppRoutes.circuit);
    } else {
      return await Navigator.pushNamed(context, AppRoutes.identity);
    }
  }
}
