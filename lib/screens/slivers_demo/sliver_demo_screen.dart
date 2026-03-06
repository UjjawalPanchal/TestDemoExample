/*
* Created by ujjawal on 06/03/26.
*/
import 'package:flutter/material.dart';
import 'package:test_project/data/constants.dart';

class SliverDemoScreen extends StatefulWidget {
  const SliverDemoScreen({super.key});

  @override
  State<SliverDemoScreen> createState() => _SliverDemoScreenState();
}

class _SliverDemoScreenState extends State<SliverDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: Text("Sliver Demo"),
            pinned: true,
            // floating: true,
            backgroundColor: Colors.purple,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flexible Title"),
              collapseMode: CollapseMode.parallax,
              background: Image.asset(Constants.placeholderImage, fit: BoxFit.cover),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Text("Child Item -- $index");
              }, childCount: 10),
            ),
          ),
          SliverToBoxAdapter(child: Text("Test Child")),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment(0, 0),
                  child: Text("Child Item -- $index"),
                );
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Text("Child Item -- $index");
              }, childCount: 10),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment(0, 0),
                  child: Text("Child Item -- $index"),
                );
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
