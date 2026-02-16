/*
* Created by ujjawal on 04/02/26.
*/

import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final Alignment? alignment;
  final Function() onCallback;

  const ContainerButton({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.alignment,
    required this.onCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      // borderRadius: BorderRadius.circular(radius ?? 0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onCallback,
        child: Container(
          height: height,
          width: width,
          alignment: alignment ?? Alignment.center,
          decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(radius ?? 0)),
          child: child,
        ),
      ),
    );
  }
}
