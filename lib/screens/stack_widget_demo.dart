/*
* Created by ujjawal on 17/02/26.
*/
import 'package:flutter/material.dart';

class StackWidgetDemo extends StatefulWidget {
  const StackWidgetDemo({super.key});

  @override
  State<StackWidgetDemo> createState() => _StackWidgetDemoState();
}

class _StackWidgetDemoState extends State<StackWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StackDemo")),
      body: Row(
        children: [
          Container(
            color: Colors.grey,
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 30,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4855.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDtd0soCSRdpo8Y5klekJdABh4emG2P29jwg&s",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  left: 120,
                  right: 0,
                  top: 30,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dummy title will come here"),
                      Flexible(child: Text("Dummy Sub title Data will goes here for description")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
