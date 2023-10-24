import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:syncverse_clone/providers/deviceProvider.dart';
import 'package:syncverse_clone/providers/onoffprovider.dart';

class SearchDevice extends ConsumerStatefulWidget {
  const SearchDevice({super.key});

  @override
  ConsumerState<SearchDevice> createState() => _SearchDeviceState();
}

TextEditingController deviceSearch = TextEditingController();

class _SearchDeviceState extends ConsumerState<SearchDevice> {
  @override
  Widget build(BuildContext context) {
    List<DeviceModel> devices = ref.watch(deviceProvider);

    List<DeviceModel> searchingDevice = deviceSearch.text.isEmpty
        ? []
        : devices.where((device) {
            final searchQuery = deviceSearch.text.toLowerCase();
            return device.deviceName.toLowerCase().contains(searchQuery);
          }).toList();
    List<bool> onoff = [];
    for (DeviceModel device in searchingDevice) {
      onoff.add(device.onof);
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
        body: Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              TextField(
                controller: deviceSearch,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      backgroundColor: const Color(0xfff1D3557)),
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('Search')),
              const SizedBox(
                height: 20,
              ),
              Text(onoff.length.toString()),
              Text((onoff.length >= 1) ? onoff[0].toString() : ''),
              Expanded(
                child: Container(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: searchingDevice.length,
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
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        height: 30,
                                        width: 30,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                searchingDevice[index].image),
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
                                      searchingDevice[index].deviceName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                      ),
                                      Text(
                                        searchingDevice[index].deviceType,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04729,
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Switch(
                                            onChanged: (bool condition) {
                                              setState(() {
                                                onoff[index] = condition;
                                              });
                                              ref
                                                  .read(onoffProvider.notifier)
                                                  .changebool(condition, index,
                                                      searchingDevice[index]);
                                              ref
                                                  .read(onoffProvider.notifier)
                                                  .getallbool();
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
                                                  .read(onoffProvider.notifier)
                                                  .removebool(index);
                                              ref
                                                  .read(deviceProvider.notifier)
                                                  .removeDevice(
                                                      searchingDevice[index]);
                                            },
                                            icon: const Icon(Icons.delete),
                                          ),
                                        ],
                                      ),
                                      //},
                                      //),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
