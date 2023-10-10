import 'package:flutter/material.dart';
import 'package:syncverse_clone/providers/deviceProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddDevices extends ConsumerStatefulWidget {
  const AddDevices({super.key});

  @override
  ConsumerState<AddDevices> createState() => _AddDevicesState();
}

class DeviceModel {
  DeviceModel(
      {required this.deviceType, required this.image, required this.onof});
  final String deviceType;
  final String image;
  bool onof;
}

class _AddDevicesState extends ConsumerState<AddDevices> {
  @override
  Widget build(BuildContext context) {
    Widget containerBox(
      title,
      tappedName,
      imageUrl,
    ) {
      var value = title;
      return GestureDetector(
        onTap: () {
          ref.read(deviceProvider.notifier).addDevice(
              DeviceModel(deviceType: title, image: imageUrl, onof: false));
          Navigator.pop(context);
        },
        child: Container(
          width: 173,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xfff1f6fe)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Center(
                      child: Text(
                    value,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ))),
            ],
          ),
        ),
      );
    }

    Future device() {
      return showModalBottomSheet(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          showDragHandle: true,
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      containerBox("Smart Regulator", "Smart Regulator",
                          "assets/images/wave.jpg"),
                      containerBox(
                          "Main Hub", "Main Hub", "assets/images/bulb.gif"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      containerBox("Smart Light", "Smart Light",
                          "assets/images/bulb.gif"),
                      containerBox("MCB", "MCB", "assets/images/mcbgif.gif"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      containerBox(
                          "Child Hub", "Child Hub", "assets/images/mcbgif.gif"),
                      containerBox(
                          "Exhaust", "Exhaust", "assets/images/run.gif"),
                    ],
                  ),
                ],
              ),
            );
          });
    }

    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(231, 238, 250, 1),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 1,
                      margin: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Good Morning , XYZ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                fontStyle: FontStyle.normal),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.003,
                          ),
                          Text(
                            "Devices : ${ref.watch(deviceProvider).length}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontStyle: FontStyle.normal),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Card(
                              elevation: 15,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              color: Colors.white,
                              child: Image.asset("assets/device1.jfif.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35, //35
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        //margin: const EdgeInsets.only(bottom: 15),
                        width: 300,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              maximumSize: const Size(500, 150),
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF152D5E)),
                          onPressed: () {
                            device();
                          },
                          child: const Text("Add Device"),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
        Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(231, 238, 250, 1),
              ),
            ))
      ],
    );
  }
}
