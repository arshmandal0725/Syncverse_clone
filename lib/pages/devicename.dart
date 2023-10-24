import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:syncverse_clone/providers/deviceProvider.dart';
import 'package:syncverse_clone/providers/onoffprovider.dart';

class DeviceName extends ConsumerStatefulWidget {
  const DeviceName({super.key, required this.image, required this.title});
  final String title;
  final String image;

  @override
  ConsumerState<DeviceName> createState() => _DeviceNameState();
}

TextEditingController deviceName = TextEditingController();

class _DeviceNameState extends ConsumerState<DeviceName> {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: const Color(0xfff1f6fe),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: deviceName,
              decoration: InputDecoration(
                  hintText: 'Device Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(38))),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(deviceProvider.notifier).addDevice(DeviceModel(
                      deviceName: deviceName.text,
                      deviceType: widget.title,
                      image: widget.image,
                      onof: false));
                  ref.read(onoffProvider.notifier).addbool();
                  Navigator.pop(context);
                  deviceName.clear();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                    backgroundColor: const Color(0xfff1D3557)),
                child: const Text("Add Device"))
          ],
        )),
      ),
    );
  }
}
