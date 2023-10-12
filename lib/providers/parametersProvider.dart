import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class ParameterNotifier extends StateNotifier<Map<String, int>> {
  ParameterNotifier() : super({'Gas': 0, 'Humidity': 0, 'Temprature': 0});
  void parameterValue() async{
    /*final url = Uri.https("https://sync-verse-default-rtdb.firebaseio.com");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      state = jsonDecode(response.body);

      // Handle the retrieved data here
    } else {
      Get.snackbar('Error Ocurred', 'Parameters data unable to fetch');
    }*/
    state = {'Gas': 60, 'Humidity': 70, 'Temprature': 80};
  }
}

final parameterProvider =
    StateNotifierProvider<ParameterNotifier, Map<String, int>>((ref) {
  return ParameterNotifier();
});
