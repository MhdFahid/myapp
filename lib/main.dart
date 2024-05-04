import 'package:app/api/api.dart';
import 'package:app/model/model.dart';
import 'package:app/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ModelApi modelApi = Get.put(ModelApi());
  MyApp({super.key});
  RxList<ModelItem> list = <ModelItem>[].obs;
  RxInt indexMain = 0.obs;
  void getList() async {
    list.value = await modelApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    getList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: ProfilePage(data: list),
      ),
    );
  }
}
