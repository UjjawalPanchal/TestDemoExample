/*
* Created by ujjawal on 11/02/26.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  final String assetId;

  const ProfileHeader({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width / 4,
      width: context.width / 4,
      child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset(assetId)),
    );
  }
}
