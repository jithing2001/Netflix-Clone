import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
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
                  image: const DecorationImage(
                      image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bfy9TykVykI9I7t19cjB51KlNaX.jpg",
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
