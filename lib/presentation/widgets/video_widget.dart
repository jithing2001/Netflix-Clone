import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class VideoWidget extends StatelessWidget {
  String imagePath;
  VideoWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            '$baseURL$imagePath',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: Colors.white,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }
}
