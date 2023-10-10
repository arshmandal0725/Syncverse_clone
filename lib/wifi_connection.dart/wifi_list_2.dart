import 'package:flutter/material.dart';
import 'package:syncverse_clone/wifi_connection.dart/wifi_password.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiList2 extends StatefulWidget {
  const WifiList2(
      {super.key,
      required this.wifiList,
      required this.ipvp4,
      required this.connectedwifiname});
  final List<WiFiAccessPoint> wifiList;
  final String ipvp4;
  final String connectedwifiname;

  @override
  State<WifiList2> createState() => _WifiListState();
}

class _WifiListState extends State<WifiList2> {
  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'WiFi List 2',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.wifiList.length,
                      itemBuilder: (ctx, index) {
                        if (widget.wifiList[index].ssid ==
                            widget.connectedwifiname) {
                          return const SizedBox.shrink();
                        } else {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) {
                                return EnterPassword(
                                  ssid: widget.wifiList[index],
                                  ipvp4: widget.ipvp4,
                                );
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(widget.wifiList[index].ssid),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
