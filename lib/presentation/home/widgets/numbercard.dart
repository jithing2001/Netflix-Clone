import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  String imagepath;
  NumberCard({super.key, required this.index, required this.imagepath});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kRadius20,
                  image: DecorationImage(
                      image: NetworkImage(
                        '$baseURL$imagepath',
                      ),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 3,
            strokeColor: kWhiteColor,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 100,
                  decoration: TextDecoration.none,
                  color: kBlackColor),
            ),
          ),
        )
      ],
    );
  }
}
