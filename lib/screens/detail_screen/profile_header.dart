/*
* Created by ujjawal on 11/02/26.
*/
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String assetId;

  const ProfileHeader({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetId, height: 100, width: 100);
  }
}
