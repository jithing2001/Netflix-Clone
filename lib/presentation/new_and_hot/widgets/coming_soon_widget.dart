import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';
import '../../../core/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  String imagePath;
  String title;
  String overView;
  String date;
  String month;
  ComingSoonWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.overView,
      required this.date,
      required this.month});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(month,
                  style: const TextStyle(fontSize: 16, color: kGreyColor)),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imagePath: imagePath),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 248,
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind me',
                        iconsize: 22,
                        textsize: 12,
                      )
                    ],
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: 'Info',
                    iconsize: 22,
                    textsize: 12,
                  ),
                  kWidth20,
                ],
              ),
              kheight20,
              const Text(
                'Coming on Friday',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              kheight,
              const Text('Outlander',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              kheight,
              const Text(
                'When a spacecraft crashes in Norway during the Iron Age, two figures emerge from the wreckage: Kainan (James Caviezel), an alien soldier, and the Moorwen, his mortal enemy.',
                style: TextStyle(color: kGreyColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
