import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCall extends StatelessWidget {
  const MainCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius20,
          image: const DecorationImage(
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/bfy9TykVykI9I7t19cjB51KlNaX.jpg"))),
    );
  }
}
