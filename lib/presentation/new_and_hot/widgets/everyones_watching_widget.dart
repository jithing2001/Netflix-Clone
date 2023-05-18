import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import '../../../core/constants.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
      kheight,
      Text('Titans',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
                kheight,
                Text('In Virginia, high school football is a way of life, an institution revered, each game celebrated more lavishly than Christmas, each playoff distinguished more grandly than any national holiday. ',
                style: TextStyle(color: kGreyColor,fontSize: 16),),
                kheight50,
                VideoWidget(),
                kheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  CustomButtonWidget(
                        icon: Icons.near_me_sharp,
                         title: 'Shear',
                         iconsize: 25,
                         textsize: 16,),
                        kWidth,
                         CustomButtonWidget(
                        icon: Icons.add,
                         title: 'MyList',
                         iconsize: 25,
                         textsize: 16,),
                         kWidth,
                         CustomButtonWidget(
                        icon: Icons.play_arrow,
                         title: 'Play',
                         iconsize: 25,
                         textsize: 16,),
                         kWidth20
                ],),
    ],);
  }
}
