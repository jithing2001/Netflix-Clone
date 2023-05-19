import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import '../../../core/constants.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  String? imagePath;
  String? title;
  String? overView;
  EveryonesWatchingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.overView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        kheight,
        Text(
          overView!,
          style: const TextStyle(color: kGreyColor, fontSize: 16),
        ),
        kheight50,
        VideoWidget(
          imagePath: imagePath!,
        ),
        kheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.near_me_sharp,
              title: 'Shear',
              iconsize: 25,
              textsize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'MyList',
              iconsize: 25,
              textsize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconsize: 25,
              textsize: 16,
            ),
            kWidth20
          ],
        ),
      ],
    );
  }
}
