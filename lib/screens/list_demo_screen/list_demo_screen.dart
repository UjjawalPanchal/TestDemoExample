/*
* Created by ujjawal on 06/02/26.
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/main.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/screens/detail_screen/detail_demo_screen.dart';
import 'package:test_project/screens/grid_demo/view/grid_demo_screen.dart';
import 'package:test_project/screens/list_demo_screen/controller/list_demo_controller.dart';
import 'package:test_project/screens/list_demo_screen/widget/android_list_item.dart';
import 'package:test_project/screens/list_demo_screen/widget/ios_list_item.dart';

class ListDemoScreen extends StatelessWidget {
  const ListDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDemoController>(
      init: ListDemoController(),
      tag: "listDemoController",
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("List Demo Screen"),
            actions: [
              IconButton(
                onPressed: () {
                  navigateToAnyScreen(GridDemoScreen());
                },
                icon: Icon(Icons.next_plan),
              ),
            ],
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (orientation == Orientation.portrait) {
                return ListUiPart(
                  controller: controller,
                  itemSelection: (item) {
                    showBottomSheet(item);
                  },
                );
              }
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListUiPart(controller: controller, itemSelection: (u) {}).paddingSymmetric(horizontal: 10),
                  ),
                  if (controller.selectedItem != null) ...[
                    Expanded(
                      key: ObjectKey(controller.selectedItem),
                      flex: 2,
                      child: DetailDemoScreen(todoId: controller.selectedItem!.id ?? 0),
                    ),
                  ],
                ],
              );
            },
          ),
        );
      },
    );
  }

  void showBottomSheet(TodoModel todoItem) {
    showModalBottomSheet(
      context: key.currentContext!,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          child: DetailDemoScreen(todoId: todoItem.id ?? 0),
        );
      },
    );
  }
}

class ListUiPart extends StatelessWidget {
  final ListDemoController controller;
  final Function(TodoModel) itemSelection;

  const ListUiPart({super.key, required this.controller, required this.itemSelection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller.searchController,
          onChanged: (value) {
            controller.onSearchFilter(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hint: Text('Search'),
            isDense: true,
            suffix: IconButton(
              onPressed: () {
                controller.searchController.clear();
                controller.onSearchFilter("");
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
        Expanded(
          child: GetX<ListDemoController>(
            tag: "listDemoController",
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                controller: controller.scrollController,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return RepaintBoundary(
                    child: InkWell(
                      onTap: () {
                        if (context.isPortrait) {
                          itemSelection(controller.dummyTodo[index]);
                          //navigateToAnyScreen(DetailDemoScreen(todoId: controller.dummyTodo[index].id ?? 0));
                        } else {
                          controller.setSelectedItem(index);
                        }
                      },
                      child: !Platform.isAndroid
                          ? AndroidListItem(mItem: controller.dummyTodo[index])
                          : IosListItem(mItem: controller.dummyTodo[index]),
                    ),
                  );
                },
                itemCount: controller.dummyTodo.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
