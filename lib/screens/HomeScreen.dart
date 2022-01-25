import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:todo/controllers/HomeController.dart';
import 'package:todo/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Görev Listem"),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Text(
                  '22 Ocak Cumartesi',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(262, 530, 20, 10),
            child: RaisedButton(
              color: Colors.black,
              child: Text(
                "Görev ekle",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                print("Todo sayfasına geçiş yapıldı");
                Get.to(() => TodoScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
