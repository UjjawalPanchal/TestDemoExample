/*
* Created by ujjawal on 02/02/26.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  List<String> arrayList = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      for (int i = 0; i < 8; i++) {
        arrayList.add("Hello text --- $i");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 56),
        child: SafeArea(
          child: Container(
            color: Colors.green,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back(result: "Hello test message returning");
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text("List View Screen", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("List Data"),
            // Flexible(child: child),
            Expanded(
              flex: 5,
              child: ColoredBox(
                color: Colors.pinkAccent,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListChildItem(
                      title: arrayList[index],
                      callback: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                      },
                    );
                  },
                  padding: EdgeInsets.all(10),
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: arrayList.length,
                  //children: [ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem()],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ColoredBox(
                color: Colors.blue.shade200,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListChildItem(
                      title: arrayList[index],
                      callback: (val) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(val)));
                      },
                    );
                  },
                  padding: EdgeInsets.all(10),
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    if (index == 4 || index == 2) {
                      return Divider(color: Colors.black);
                    } else {
                      return SizedBox();
                    }
                  },
                  itemCount: arrayList.length,
                  //children: [ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem(), ListChildItem()],
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Hello")),
            Text("End Of the Widget"),
          ],
        ),
      ),
    );
  }
}

class ListChildItem extends StatelessWidget {
  final String title;
  final Function(String) callback;

  const ListChildItem({super.key, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(title),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            child: Icon(Icons.person, color: Colors.white),
          ),
          Text(title, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
