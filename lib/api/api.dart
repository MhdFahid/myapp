import 'dart:convert';
import 'package:app/model/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ModelApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  String api = 'https://rubidya.com/api/users/get-media';
  String tokenkey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjBiZmUxODE3ZmYzZjBkMmZjMmQwNGUiLCJpYXQiOjE3MTQ3MTkyMDMsImV4cCI6MTc4MzgzOTIwM30.HfsYDcVEzMsdi6pU24IzHzmGAxfDQ2NAJYIptOAu_9I';

  Future<List<ModelItem>> getData() async {
    try {
      final response = await http.get(
        Uri.parse(api),
        headers: {'Authorization': 'Bearer $tokenkey'},
      );

      if (response.statusCode == 200) {
        final List<ModelItem> data =
            (json.decode(response.body)['media'] as List)
                .map((json) => ModelItem.fromJson(json))
                .toList();

        update();
        return data;
      } else {
        print('Error fetching data. Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to be caught by the FutureBuilder
    }
  }
}
