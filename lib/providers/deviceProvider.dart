import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncverse_clone/pages/addDevices_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceNotifier extends StateNotifier<List<DeviceModel>> {
  DeviceNotifier() : super([]);
  void addDevice(DeviceModel device) {
    state = [...state, device];
    final url = Uri.https(
        'sync-verse-4a6e2-default-rtdb.firebaseio.com', 'devices.json');
    http.post(url,
        body: json.encode({
          'device type': device.deviceType,
          'image': device.image,
          'switch condition': device.onof
        }));
  }

  void removeDevice(DeviceModel device) {
    state.remove(device);
  }
}

final deviceProvider =
    StateNotifierProvider<DeviceNotifier, List<DeviceModel>>((ref) {
  return DeviceNotifier();
});
