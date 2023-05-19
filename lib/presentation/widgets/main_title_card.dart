import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/maincall.dart';
import 'package:netflix_clone/presentation/widgets/maintitle.dart';

class MainTitleCard extends StatelessWidget {
  Future<List> function;
  MainTitleCard({super.key, required this.title, required this.function});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => FutureBuilder(
                  future: function,
                  builder: (context, snapshot) {
                    String? imagePath = snapshot.data?[index].posterPath;
                    return snapshot.hasData
                        ? MainCall(
                            imagePath: imagePath,
                          )
                        : const Center(
                            child: CircularProgressIndicator(color: Colors.red),
                          );
                  },
                ),
              )),
        )
      ],
    );
  }
}
