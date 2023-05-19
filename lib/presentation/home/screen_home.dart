import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/popular/popular_functions.dart';

import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';
import 'package:netflix_clone/south_indian/south_indian_function.dart';
import 'package:netflix_clone/tense_drama/tense_drama_function.dart';
import 'package:netflix_clone/top10/top10_functions.dart';
import 'package:netflix_clone/trending/trending_functions.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, child) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(children: [
                  ListView(
                    children: [
                      const BackGroundCardWidget(),
                      kheight,
                      MainTitleCard(
                        title: "Released in the Past Year",
                        function: getImagesPopular(),
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Trending Now',
                        function: getImageTrending(),
                      ),
                      kheight,
                      NumberTitleCard(
                        function: getImagetop10(),
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'Tense Dramas',
                        function: getImageTense(),
                      ),
                      kheight,
                      MainTitleCard(
                        title: 'South Indian Cinema',
                        function: getImageSouth(),
                      ),
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(microseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                    width: 70,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    size: 30,
                                  ),
                                  kWidth,
                                  Container(
                                    color: Colors.blue,
                                    width: 27,
                                    height: 27,
                                  )
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'TV Shows',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Movies',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'categories',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ))
                      : kheight
                ]),
              );
            }));
  }
}
