import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:syncverse_clone/providers/deviceProvider.dart';
import 'package:syncverse_clone/providers/onoffprovider.dart';
import 'package:syncverse_clone/providers/parametersProvider.dart';
import 'package:syncverse_clone/widgets/theme_content.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      ref.read(parameterProvider.notifier).parameterValue();
    });

    ref.read(deviceProvider.notifier).getallDevice();
    super.initState();
    ref.read(onoffProvider.notifier).getallbool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DeviceModel> devices = ref.watch(deviceProvider);
    List<bool> onoff = ref.watch(onoffProvider);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(231, 238, 250, 1),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 42, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ContentShowModel(
                          color: const Color.fromARGB(255, 56, 57, 157),
                          theme: 'Temprature',
                          value: (ref.watch(parameterProvider)["Temprature"] ==
                                  null)
                              ? 0
                              : ref.watch(parameterProvider)["Temprature"]!,
                        ),
                        const Spacer(),
                        ContentShowModel(
                          color: const Color.fromARGB(255, 99, 131, 241),
                          theme: 'Gas',
                          value: (ref.watch(parameterProvider)["Gas"] == null)
                              ? 0
                              : ref.watch(parameterProvider)["Gas"]!,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ContentShowModel(
                          color: const Color.fromARGB(255, 82, 82, 82),
                          theme: 'Humidity',
                          value:
                              (ref.watch(parameterProvider)["Humidity"] == null)
                                  ? 0
                                  : ref.watch(parameterProvider)["Humidity"]!,
                        ),
                        const Spacer(),
                        const ContentShowModel(
                          color: Color.fromARGB(255, 255, 159, 83),
                          theme: 'Temprature',
                          value: 50,
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 6,
              child: SizedBox(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          image:
                                              AssetImage(devices[index].image),
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
                                              //switch to on and of
                                              onChanged: (bool condition) {
                                                ref
                                                    .read(
                                                        onoffProvider.notifier)
                                                    .changebool(condition,
                                                        index, devices[index]);
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
                                                    .read(
                                                        deviceProvider.notifier)
                                                    .removeDevice(
                                                        devices[index]);
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
      ),
    );
  }
}
