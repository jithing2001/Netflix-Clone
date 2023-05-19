import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCall extends StatelessWidget {
  String? imagePath;
  MainCall({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image: DecorationImage(image: NetworkImage('$baseURL$imagePath'))),
    );
  }
}
