import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:syncverse_clone/pages/addDevices_page.dart';

class OnoffNotifier extends StateNotifier<List<bool>> {
  OnoffNotifier() : super([]);
  Future<void> getallbool() async {
    final url = Uri.https(
      'sync-verse-4a6e2-default-rtdb.firebaseio.com',
      'devices.json',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> dataMap = json.decode(response.body);
        List<DeviceModel> dataList = [];
        List<bool> boolList = [];

        dataMap.forEach((key, value) {
          dataList.add(DeviceModel(
              deviceName: value["device name"],
              deviceType: value["device type"],
              image: value["image"],
              onof: value["switch condition"],
              key: key));
        });

        for (DeviceModel data in dataList) {
          boolList.add(data.onof);
        }
        state = boolList;
      } else {
        throw Exception('Failed to load data from Firebase');
      }
    } catch (error) {
      // Handle the HTTP GET error here, e.g., log the error or show an error message.
      print('Error fetching devices: $error');
    }
  }

  void addbool() {
    state = [...state, false];
  }

  void removebool(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }

  void changebool(bool onoff, int index, DeviceModel device) async {
    state[index] = onoff;
    state = [...state];

    try {
      final url = Uri.https("sync-verse-4a6e2-default-rtdb.firebaseio.com",
          "devices/${device.key}.json");

      final response = await http.patch(
        url,
        body: json.encode({'switch condition': onoff}),
      );

      if (response.statusCode != 200) {
        print(
            'Failed to update isSwitchOn in Firebase: ${response.statusCode}');
      }
    } catch (error) {
      // Handle error
      print('Error updating isSwitchOn variable: $error');
    }
  }
}

final onoffProvider = StateNotifierProvider<OnoffNotifier, List<bool>>((ref) {
  return OnoffNotifier();
});
