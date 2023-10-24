import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceNotifier extends StateNotifier<List<DeviceModel>> {
  DeviceNotifier() : super([]);

  void addDevice(DeviceModel device) async {
    state = [...state, device];
    final url = Uri.https(
      'sync-verse-4a6e2-default-rtdb.firebaseio.com',
      'devices.json',
    );

    final response = await http
        .post(
      url,
      body: json.encode({
        'device name': device.deviceName,
        'device type': device.deviceType,
        'image': device.image,
        'switch condition': device.onof,
      }),
    )
        .catchError((error) {
      // Handle the HTTP POST error here, e.g., log the error or show an error message.
      print('Error adding device: $error');
    });
    if (response.statusCode == 200) {
      getallDevice();
    }
  }

  Future<void> getallDevice() async {
    final url = Uri.https(
      'sync-verse-4a6e2-default-rtdb.firebaseio.com',
      'devices.json',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataMap = json.decode(response.body);
        List<DeviceModel> dataList = [];

        dataMap.forEach((key, value) {
          dataList.add(DeviceModel(
              deviceName: value["device name"],
              deviceType: value["device type"],
              image: value["image"],
              onof: value["switch condition"],
              key: key));
        });

        state = dataList;
      } else {
        throw Exception('Failed to load data from Firebase');
      }
    } catch (error) {
      // Handle the HTTP GET error here, e.g., log the error or show an error message.
      print('Error fetching devices: $error');
    }
  }

  void removeDevice(DeviceModel device) async {
    state = state.where((m) => m.key != device.key).toList();
    final url = Uri.https("sync-verse-4a6e2-default-rtdb.firebaseio.com",
        "devices/${device.key}.json");

    final response = await http.delete(url);
    if (response.statusCode == 200) {
      print('Data deleted successfully.');
    } else {
      print('Failed to delete data from Firebase.');
    }
  }
}

final deviceProvider =
    StateNotifierProvider<DeviceNotifier, List<DeviceModel>>((ref) {
  return DeviceNotifier();
});
