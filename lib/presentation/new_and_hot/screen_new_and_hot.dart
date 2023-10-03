// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_clone/presentation/widgets/shimmer_widget.dart';
import 'package:netflix_clone/tense_drama/tense_drama_function.dart';
import 'package:netflix_clone/trending/trending_functions.dart';

String? month;
String? converteddate;

class ScreenNewAndHot extends StatelessWidget {
  ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 3,
                  color: Colors.blue,
                ),
                kWidth,
              ],
              bottom: TabBar(
                  labelColor: kButtonColorBlack,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: '''👀 Everyone's watching''',
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryoneWatching(),
          ]),
        ));
  }

  Widget _buildComingSoon() {
    return FutureBuilder(
      future: getImageTrending(),
      builder: (context, snapshot) {
        if (snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerWidget();
        } else {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                String? imagePath = snapshot.data?[index].backdrop_path;
                String? date = snapshot.data?[index].release_date;

                if (date != null) {
                  int convertedMonth = int.parse(date[5] + date[6]);
                  converteddate = date[8] + date[9];

                  if (convertedMonth == 1) {
                    month = 'JAN';
                  } else if (convertedMonth == 2) {
                    month = 'FEB';
                  } else if (convertedMonth == 3) {
                    month = 'MAR';
                  } else if (convertedMonth == 4) {
                    month = 'APR';
                  } else if (convertedMonth == 5) {
                    month = 'MAY';
                  } else if (convertedMonth == 6) {
                    month = 'JUN';
                  } else if (convertedMonth == 7) {
                    month = 'JUL';
                  } else if (convertedMonth == 8) {
                    month = 'AUG';
                  } else if (convertedMonth == 9) {
                    month = 'SEP';
                  } else if (convertedMonth == 10) {
                    month = 'OCT';
                  } else if (convertedMonth == 11) {
                    month = 'NOV';
                  } else if (convertedMonth == 12) {
                    month = 'DEC';
                  }
                }
                return ComingSoonWidget(
                  date: converteddate!,
                  imagePath: imagePath!,
                  month: month!,
                  overView: snapshot.data![index].overview!,
                  title: snapshot.data![index].title!,
                );
              });
        }
      },
    );
  }

  Widget _buildEveryoneWatching() {
    return FutureBuilder(
      future: getImageTense(),
      builder: (context, snapshot) {
        if (snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerWidget();
        } else {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                String? imagePath = snapshot.data?[index].backdropPath;
                return EveryonesWatchingWidget(
                  imagePath: imagePath,
                  overView: snapshot.data![index].overview,
                  title: snapshot.data![index].title,
                );
              });
        }
      },
    );
  }
}
