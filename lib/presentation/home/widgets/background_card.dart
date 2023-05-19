import 'package:flutter/material.dart';
import 'package:netflix_clone/background/background_function.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';

class BackGroundCardWidget extends StatelessWidget {
  const BackGroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: getImageBackground(),
          builder: (context, snapshot) {
            String? imagePath = snapshot.data?[0].posterPath;
            return snapshot.hasData
                ? Container(
                    width: double.infinity,
                    height: 600,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('$baseURL$imagePath'))),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                playBotton(),
                const CustomButtonWidget(icon: Icons.info, title: 'info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton playBotton() {
    return TextButton.icon(
        onPressed: () {},
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kWhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ));
  }
}
