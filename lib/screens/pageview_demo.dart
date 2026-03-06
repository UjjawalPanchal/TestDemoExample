/*
* Created by ujjawal on 05/03/26.
*/
import 'package:flutter/material.dart';

class PageviewDemo extends StatefulWidget {
  const PageviewDemo({super.key});

  @override
  State<PageviewDemo> createState() => _PageviewDemoState();
}

class _PageviewDemoState extends State<PageviewDemo> {
  PageController pageController = PageController();

  bool buttonClicked = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final bool? shouldPop = await _showBackDialog();
        if (shouldPop ?? false) {
          // If the user confirms in the dialog, manually pop the route
          if (mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Page View Demo")),
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          children: [getChildForPage(1), getChildForPage(2), getChildForPage(3)],
          onPageChanged: (value) {
            print("CurrentPage - $value");
            pageController.jumpTo(pageController.page! + 1); // = pageController.page+1;
          },
        ),
      ),
    );
  }

  Widget getChildForPage(int index) {
    return Center(
      child: Column(
        children: [
          Transform.flip(
            flipX: buttonClicked,
            flipY: !buttonClicked,
            child: Text("Page - $index", style: TextStyle(fontSize: 40)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                buttonClicked = !buttonClicked;
              });
            },
            child: Text("Button"),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Title"),
                  Text("Are you sure you want to exit?"),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
