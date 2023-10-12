import 'package:flutter/material.dart';
import 'package:syncverse_clone/providers/deviceProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/providers/onoffprovider.dart';

class AddDevices extends ConsumerStatefulWidget {
  const AddDevices({super.key});

  @override
  ConsumerState<AddDevices> createState() => _AddDevicesState();
}

class DeviceModel {
  DeviceModel({
    required this.deviceType,
    required this.image,
    required this.onof,
    String? key,
  }) : key = key ?? '';

  final String deviceType;
  final String image;
  bool onof;
  String key;
}

class _AddDevicesState extends ConsumerState<AddDevices> {
  @override
  Widget build(BuildContext context) {
    List<DeviceModel> devices = ref.watch(deviceProvider);
    List<bool> onoff = ref.watch(onoffProvider);
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
          ref.read(onoffProvider.notifier).addbool();
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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: devices.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        child: Container(
                          decoration: const BoxDecoration(
                              /*gradient: LinearGradient(
                              colors: boolList[index]
                                  ? (selectedGradientColors[index] ??
                                      (index % 3 == 1
                                          ? color1
                                          : index % 3 == 2
                                              ? color2
                                              : color3))
                                  : color4, //color4

                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),*/
                              ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.wifi),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    height: 30,
                                    width: 30,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(7),
                                      ),
                                      child: Image(
                                        image: AssetImage(devices[index].image),
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  devices[index].deviceType,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.04729,
                                child: SizedBox(
                                  height: 50,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Switch(
                                            onChanged: (bool condition) {
                                              ref
                                                  .read(onoffProvider.notifier)
                                                  .changebool(condition, index,
                                                      devices[index]);
                                            },
                                            value: onoff[index],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            child: Text(
                                              onoff[index] ? "ON" : "OFF",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(deviceProvider.notifier)
                                                  .removeDevice(devices[index]);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                      //},
                                      //),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ))
      ],
    );
  }
}
