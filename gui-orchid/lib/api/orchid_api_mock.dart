import 'dart:async';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:orchid/api/orchid_api.dart';
import 'package:orchid/api/orchid_api_real.dart';
import 'package:orchid/api/orchid_types.dart';
import 'package:orchid/api/preferences/user_preferences.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'monitoring/analysis_db.dart';
import 'monitoring/restart_manager.dart';
import 'orchid_budget_api.dart';
import 'orchid_log_api.dart';

///
/// Mock Orchid App Channel API Implementation
///
class MockOrchidAPI implements OrchidAPI {
  static final MockOrchidAPI _singleton = MockOrchidAPI._internal();

  factory MockOrchidAPI() {
    return _singleton;
  }

  MockOrchidAPI._internal() {
    debugPrint("constructed mock API");
    _initChannel();
  }

  /// Publish the connection status.
  final vpnExtensionStatus = BehaviorSubject<OrchidVPNExtensionState>();

  /// Publish the orchid network connection status.
  final BehaviorSubject<OrchidVPNRoutingState> vpnRoutingStatus =
      BehaviorSubject<OrchidVPNRoutingState>.seeded(
          OrchidVPNRoutingState.VPNNotConnected);

  /// Publishes a status of true if the user has granted any necessary OS level permissions to allow
  /// installation and activation of the Orchid VPN networking extension.
  /// Note: On iOS this corresponds to having successfully saved the Orchid VPN configuration via the
  /// NEVPNManager API.
  final vpnPermissionStatus = BehaviorSubject<bool>();

  final circuitConfigurationChanged = BehaviorSubject<void>.seeded(null);

  /// Initialize the Channel implementation.
  /// This method is called once when the application is initialized.
  void _initChannel() {
    // init connection status
    vpnExtensionStatus.add(OrchidVPNExtensionState.NotConnected);

    // Update the orchid routing status when the vpn or (mock) orchid
    // tunnel connection state changes.
    vpnExtensionStatus.listen((OrchidVPNExtensionState state) {
      var applyRoutingStatus = RealOrchidAPI.applyRoutingStatus;
      switch (state) {
        case OrchidVPNExtensionState.Invalid:
        case OrchidVPNExtensionState.NotConnected:
          applyRoutingStatus(OrchidVPNRoutingState.VPNNotConnected);
          break;
        case OrchidVPNExtensionState.Connecting:
          applyRoutingStatus(OrchidVPNRoutingState.VPNConnecting);
          break;

        case OrchidVPNExtensionState.Connected:
          applyRoutingStatus(OrchidVPNRoutingState.VPNConnected);

          // Mock orchid routing if routing is enabled.
          UserPreferences().routingEnabled.get().then((routing) {
            if (routing) {
              Future.delayed(Duration(seconds: 1), () {
                applyRoutingStatus(OrchidVPNRoutingState.OrchidConnected);
              });
            }
          });

          break;
        case OrchidVPNExtensionState.Disconnecting:
          applyRoutingStatus(OrchidVPNRoutingState.VPNDisconnecting);
          break;
      }
    });

    // vpn configuration / permission status
    vpnPermissionStatus.add(false);

    // fake monitoring traffic data
    UserPreferences().monitoringEnabled.stream().listen((monitoring) {
      if (monitoring) {
        insertMockTrafficData();
      }
    });
  }

  static Future<Database> initInMemoryAnalysisDb() async {
    log("mock: initInMemoryAnalysisDb");
    var db = await openDatabase(':memory', readOnly: false);
    // should match capture.cpp
    var createTable = 'create table "flow" ('
        '"id" integer primary key autoincrement,'
        '"start" real,'
        '"layer4" integer,'
        '"src_addr" integer,'
        '"src_port" integer,'
        '"dst_addr" integer,'
        '"dst_port" integer,'
        '"protocol" string,'
        '"hostname" text'
        ')';
    try {
      await db.execute(createTable);
    } catch (err) {
      log("mock: create table error in mock db: $err");
    }
    return db;
  }

  Future<void> insertMockTrafficData() async {
    log("mock: insertMockTrafficData");
    var db = await AnalysisDb().getDb();
    var inserts = """
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365221146,1,168230915,0,134744072,0,'ICMP',NULL);
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365607905,17,168230915,63400,134744072,53,'DNS',NULL);
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3656754512,6,168230915,62133,-1395063294,443,'TCP','googleads.g.doubleclick.net');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3657346875,6,168230915,64825,1823570364,5228,'TCP','mtalk.google.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365790799,6,168230915,62160,301799886,443,'TCP','mesu.apple.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365795197,6,168230915,62162,-1377888904,443,'TCP','configuration.apple.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365807072,6,168230915,62170,-1645211101,443,'TCP','www.facebook.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.365855324,6,168230915,62186,1666514438,443,'TCP','www.orchid.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3722021645,17,168230915,60095,-268435462,1900,'HTTP/1.1','239.255.255.250:1900');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3722152663,6,168230915,62248,-1395062454,443,'TCP','youtubei.googleapis.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3722716896,6,168230915,49653,-1379745172,993,'TCP','imap.gmail.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3774122684,6,168230915,62258,1666514598,443,'TCP','slack.com');
INSERT INTO flow(start,layer4,src_addr,src_port,dst_addr,dst_port,protocol,hostname) VALUES (2458712.3774122684,6,168230915,62258,1666514598,443,'TLS','slack.com');
    """;
    var statements = inserts.trim().split('\n');
    for (var statement in statements) {
      await db.rawInsert(statement);
    }
  }

  /// The Flutter application uses this method to indicate to the native channel code
  /// that the UI has finished launching and all listeners have been established.
  Future<void> applicationReady() async {
    // Monitor user preferences and start or stop the VPN extension.
    await OrchidRestartManager().initVPNControlListener();
    return null;
  }

  /// Get the logging API.
  @override
  OrchidLogAPI logger() {
    return OrchidLogAPI.defaultLogAPI;
  }

  /// Trigger a request for OS level permissions required to allow installation and activation of the
  /// Orchid VPN networking extension, potentially causing the OS to prompt the user.
  /// Returns true if the permission was granted.
  /// Note: On iOS this corresponds to an attempt to save the Orchid VPN configuration via the
  /// NEVPNManager API.
  @override
  Future<bool> requestVPNPermission() async {
    vpnPermissionStatus.add(true);
    return true;
  }

  /// Remove the VPN networking extension.
  Future<void> revokeVPNPermission() async {
    OrchidAPI().vpnPermissionStatus.add(false);
  }

  Timer _connectFuture;

  /// Set the desired connection state: true for connected, false to disconnect.
  /// Note: This mock shows the connecting state for N seconds and then connects
  /// Note: successfully.
  @override
  Future<void> setVPNExtensionEnabled(bool enabled) async {
    const fakeDelay = 3000;
    log("mock: setVPNExtensionEnabled = $enabled, vpnConnectionStatus = ${vpnExtensionStatus.value}");
    switch (vpnExtensionStatus.value) {
      case OrchidVPNExtensionState.Invalid:
      case OrchidVPNExtensionState.NotConnected:
      case OrchidVPNExtensionState.Disconnecting:
        // Cancel any pending connect or disconnect
        if (_connectFuture != null) {
          _connectFuture.cancel();
          _connectFuture = null;
        }

        if (enabled) {
          _setConnectionState(OrchidVPNExtensionState.Connecting);

          _connectFuture = Timer(Duration(milliseconds: fakeDelay), () {
            _setConnectionState(OrchidVPNExtensionState.Connected);
          });
        } else {
          return; // redundant disconnect
        }
        break;
      case OrchidVPNExtensionState.Connecting:
      case OrchidVPNExtensionState.Connected:
        // Cancel any pending connect or disconnect
        if (_connectFuture != null) {
          _connectFuture.cancel();
          _connectFuture = null;
        }
        if (enabled) {
          // redundant connect
          return;
        } else {
          _setConnectionState(OrchidVPNExtensionState.Disconnecting);
          _connectFuture = Timer(Duration(milliseconds: fakeDelay), () {
            _setConnectionState(OrchidVPNExtensionState.NotConnected);
          });
        }

        break;
    }
  }

  /// Choose a new, randomized, network route.
  @override
  Future<void> reroute() async {}

  void _setConnectionState(OrchidVPNExtensionState state) {
    logger().write('Connection state: $state');
    vpnExtensionStatus.add(state);
  }

  @override
  OrchidBudgetAPI budget() {
    return OrchidBudgetAPI();
  }

  Future<String> groupContainerPath() async {
    return 'mock-no-container';
  }

  /// The build version
  Future<String> versionString() async {
    return "1.0.0";
  }

  /// Get the Orchid Configuration file contents
  Future<String> getConfiguration() async {
    // return _platform.invokeMethod('get_config');
    // Return only the user visible portion of the config.
    return await UserPreferences().getUserConfig();
  }

  /// Set the Orchid Configuration file contents
  Future<bool> setConfiguration(String userConfig) async {
    var combinedConfig = await RealOrchidAPI.generateCombinedConfig(userConfig);
    log("api fake: combinedConfig = $combinedConfig");
    // Do nothing.  Fake save.
    return true;
  }

  /// Publish the latest configuration to the VPN.
  Future<bool> updateConfiguration() async {
    return setConfiguration(await UserPreferences().getUserConfig());
  }

  void dispose() {
    vpnExtensionStatus.close();
    circuitConfigurationChanged.close();
    vpnRoutingStatus.close();
    vpnPermissionStatus.close();
  }
}
