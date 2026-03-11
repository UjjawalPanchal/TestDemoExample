/*
* Created by ujjawal on 06/02/26.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/main.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/repositories/todo_repo/todo_repo_impl.dart';
import 'package:test_project/screens/detail_screen/detail_demo_screen.dart';
import 'package:test_project/screens/list_demo_screen/controller/list_demo_controller.dart';
import 'package:test_project/screens/list_demo_screen/widget/android_list_item.dart';

class ListDemoScreen extends StatelessWidget {
  const ListDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDemoController>(
      init: ListDemoController(todoRepo: TodoRepoImpl()),
      tag: "listDemoController",
      builder: (controller) {
        return Scaffold(
          key: controller.drawerKey,
          appBar: AppBar(
            title: const Text("List Demo Screen"),
            actions: [
              IconButton(
                onPressed: () {
                  controller.drawerKey.currentState!.openDrawer();

                  // launchUrl(Uri.parse("https://www.youtube.com?watch=hsdagfau"));
                  // launchUrlString("https://wa.me/918866110938");

                  // canLaunchUrl(Uri.parse('mailto:test@gmail.com')).then((bool result) {
                  //   print("Can Launch URL - $result");
                  //   if (result) {
                  //     launchUrl(Uri(scheme: 'mailto', path: 'test@gmail.com'));
                  //   }
                  // });

                  //navigateToAnyScreen(GridDemoScreen());
                  // controller.drawerKey.currentState.toString();
                },
                icon: Icon(Icons.next_plan),
              ),
            ],
          ),
          drawer: Drawer(child: ListView.builder(itemBuilder: (context, index) => Text("Index = $index"))),
          body: OrientationBuilder(
            builder: (context, orientation) {
              if (controller.isLoading.value && controller.todoList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (orientation == Orientation.portrait) {
                return ListUiPart(
                  controller: controller,
                  itemSelection: (item) {
                    // navigateByName("${MyRoutes.listDetails}/${item.id.toString()}");
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
                      child: DetailDemoScreen(todoId: controller.selectedItem!.id.toString()),
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
          child: DetailDemoScreen(todoId: todoItem.id.toString()),
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
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            suffixIcon: Obx(() {
              debugPrint("${controller.isLoading}");
              return controller.searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.searchController.clear();
                        controller.onSearchFilter("");
                      },
                      icon: Icon(Icons.close),
                    )
                  : SizedBox();
            }),
          ),
        ).marginSymmetric(horizontal: 10),
        Expanded(
          child: GetBuilder<ListDemoController>(
            tag: "listDemoController",
            id: "listViewUI",
            builder: (controller) {
              return RefreshIndicator(
                onRefresh: () {
                  return controller.getTodoListData();
                },
                child: ListView.separated(
                  controller: controller.scrollController,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    if (index == controller.dummyTodo.length) {
                      return Container(
                        height: 70,
                        margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
                        child: controller.dummyTodo.length < controller.total
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(),
                      );
                    }
                    return RepaintBoundary(
                      key: ObjectKey(controller.dummyTodo[index]),
                      child: InkWell(
                        onTap: () {
                          if (context.isPortrait) {
                            itemSelection(controller.dummyTodo[index]);
                            // navigateToAnyScreen(DetailDemoScreen(todoId: controller.dummyTodo[index].id.toString()));
                          } else {
                            controller.setSelectedItem(index);
                          }
                        },
                        child: AndroidListItem(mItem: controller.dummyTodo[index]),
                        //: IosListItem(mItem: controller.dummyTodo[index]),
                      ),
                    );
                  },
                  itemCount: controller.dummyTodo.length + 1,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
