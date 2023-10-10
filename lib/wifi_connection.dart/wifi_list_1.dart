import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:syncverse_clone/wifi_connection.dart/wifi_list_2.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiList extends StatefulWidget {
  const WifiList({super.key});

  @override
  State<WifiList> createState() => _WifiListState();
}

List<WiFiAccessPoint> accessPoints = []; // Updated data type here
StreamSubscription<List<WiFiAccessPoint>>? subscription;
bool shouldCheckCan = true;
bool get isStreaming => subscription != null;
String ipv4 = '';
String wifiname = '';
bool list = false;

Widget presentScreen = const Center(
  child: CircularProgressIndicator(),
);

class _WifiListState extends State<WifiList> {
  Future<void> _startScan(BuildContext context) async {
    // check if "can" startScan
    if (shouldCheckCan) {
      // check if can-startScan
      final can = await WiFiScan.instance.canStartScan();
      // if can-not, then show error
      if (can != CanStartScan.yes) {
        if (mounted) {
          Get.snackbar("Alert", "Cannot start scan: $can");
        }
        return;
      }
    }

    // call startScan API
    final result = await WiFiScan.instance.startScan();
    if (mounted) {
      // Get.snackbar("Alert", "startScan: $result");
    }

    // reset access points.
    setState(() => accessPoints = <WiFiAccessPoint>[]);
  }

  Future<bool> _canGetScannedResults(BuildContext context) async {
    if (shouldCheckCan) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        if (mounted) {
          Get.snackbar("Alert", "Cannot get scanned results: $can");
        }

        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }

  Future<void> _getScannedResults(BuildContext context) async {
    if (await _canGetScannedResults(context)) {
      // get scanned results
      final results = await WiFiScan.instance.getScannedResults();
      setState(() {
        accessPoints = results;
        list = true;
      });
    }
  }

  void getWifiIPv4Address() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.wifi) {
      try {
        final wifiInfo = await WifiInfoPlugin.wifiDetails;
        wifiname = wifiInfo!.ssid;
        ipv4 = wifiInfo.dns1;
      } catch (e) {
        print('not working');
      }
    }
  }

  @override
  void initState() {
    getWifiIPv4Address();
    _startScan(context);
    _getScannedResults(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (presentScreen == true) {
      presentScreen = Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'WiFi List 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: accessPoints.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return WifiList2(
                                wifiList: accessPoints,
                                ipvp4: ipv4,
                                connectedwifiname: accessPoints[index].ssid,
                              );
                            }));
                          },
                          child: Container(
                            color: Colors.white,
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(accessPoints[index].ssid),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
        foregroundColor: Colors.black,
        title: Image.asset(
          'assets/SV.png',
          height: 20,
        ),
      ),
      backgroundColor: const Color.fromRGBO(231, 238, 250, 1),
      body: presentScreen,
    );
  }
}
