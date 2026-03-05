/*
* Created by ujjawal on 28/02/26.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/grid_demo/controller/grid_demo_controller.dart';
import 'package:test_project/screens/grid_demo/widgets/grid_child_item_widget.dart';

class GridDemoScreen extends StatelessWidget {
  const GridDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GridDemoController>(
      init: GridDemoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text("Grid Demo")),
          body: LayoutBuilder(
            builder: (context, constraint) {
              return GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: constraint.maxWidth > 600 ? 6 : 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  // childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return GridChildItemWidget();
                },
                itemCount: 10,
              );
            },
          ),
        );
      },
    );
  }
}
