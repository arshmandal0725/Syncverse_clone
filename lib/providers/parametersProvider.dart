import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ParameterNotifier extends StateNotifier<Map<String, int>> {
  ParameterNotifier() : super({'Temprature': 0, 'Gas': 0, 'Humidity': 0});
  void parameterValue() {
    /*final url = Uri.https("https://sync-verse-default-rtdb.firebaseio.com");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      state = jsonDecode(response.body);

      // Handle the retrieved data here
    } else {
      Get.snackbar('Error Ocurred', 'Parameters data unable to fetch');
    }*/
    state = {'Temprature': 60, 'Gas': 70, 'Humidity': 80};
  }
}

final parameterProvider =
    StateNotifierProvider<ParameterNotifier, Map<String, int>>((ref) {
  return ParameterNotifier();
});
