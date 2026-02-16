/*
* Created by ujjawal on 13/02/26.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/counter/controller/count_controller.dart';

class CounterDemo extends StatelessWidget {
  const CounterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CounterDemo")),
      body: Center(
        child: GetBuilder<CountController>(
          init: CountController(),
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return Text("${controller.count} ---- ${controller.name.value}");
                }),
                GetX<CountController>(
                  init: controller,
                  // id: "name",
                  builder: (logic) {
                    print("update- name");
                    return Text(controller.name.value);
                  },
                ),
                TextButton(
                  onPressed: () {
                    controller.onButtonPress();
                  },
                  child: Text("Update Count"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
