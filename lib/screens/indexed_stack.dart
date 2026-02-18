/*
* Created by ujjawal on 17/02/26.
*/
import 'package:flutter/material.dart';
import 'package:test_project/screens/stack_widget_demo.dart';

class IndexedStackDemo extends StatefulWidget {
  const IndexedStackDemo({super.key});

  @override
  State<IndexedStackDemo> createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends State<IndexedStackDemo> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          StackWidgetDemo(),
          Container(color: Colors.green),
          Container(color: Colors.purple),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.eighteen_mp), label: "Tab 1"),
          BottomNavigationBarItem(icon: Icon(Icons.eighteen_up_rating_outlined), label: "Tab 2"),
          BottomNavigationBarItem(icon: Icon(Icons.one_k_outlined), label: "Tab 3"),
        ],
      ),
    );
  }

  Widget getCurrentIndexWidget() {
    switch (_currentIndex) {
      case 0:
        return StackWidgetDemo();
      case 1:
        return Container(color: Colors.green);
      case 2:
        return Container(color: Colors.purple);
    }
    return SizedBox();
  }
}
