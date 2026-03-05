/*
* Created by ujjawal on 28/02/26.
*/
import 'package:flutter/material.dart';
import 'package:test_project/data/constants.dart';

class GridChildItemWidget extends StatelessWidget {
  const GridChildItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, strokeAlign: 1),
      ),
      child: Image.asset(Constants.placeholderImage),
    );
  }
}
