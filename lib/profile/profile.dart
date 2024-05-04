import 'dart:ffi';

import 'package:app/api/api.dart';
import 'package:app/model/model.dart';
import 'package:app/profile/widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

Int indexMain = 0 as Int;

class ProfilePage extends StatelessWidget {
  ModelApi modelApi = Get.put(ModelApi());
  ProfilePage({super.key, required this.data});

  RxList<ModelItem> list = <ModelItem>[].obs;
  final List<ModelItem> data;
  void getList() async {
    list.value = await modelApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(image),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              Text('62'),
                              Text('Post'),
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              Text('564'),
                              Text('Followers'),
                            ],
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            children: [
                              Text('565'),
                              Text('Following'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'kumar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Bio'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blue,
                        ),
                        width: 150,
                        height: 45,
                        child: Center(
                            child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blue,
                        ),
                        width: 150,
                        height: 45,
                        child: Center(
                            child: Text(
                          'Wallet',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                      // ElevatedButton(onPressed: () {}, child: Text('Edit Profile')),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              )))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('Photos'), Text('Videos')],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GetBuilder<ModelApi>(builder: (context) {
              getList();

              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.6),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  ModelItem daaa = list[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(daaa.filePath))),

                          // child: Text('${data.firstName}'),
                        ),
                      ),
                      Positioned(
                          bottom: 6,
                          right: 6,
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FaIcon(
                                FontAwesomeIcons.message,
                                color: Colors.white,
                              ),
                            ],
                          ))
                    ],
                  );
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Color.fromARGB(221, 2, 51, 86),
        unselectedItemColor: const Color.fromARGB(255, 101, 75, 74),
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'add', icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
