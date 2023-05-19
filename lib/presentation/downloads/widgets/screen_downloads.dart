import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/popular/popular_functions.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads ',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    'https://image.tmdb.org/t/p/w500//qnqGbB22YJ7dSs4o6M7exTpNxPz.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'We will download a personalized selection of\nmovies and shows for you, so there is\nalways something to watch on your\ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        FutureBuilder(
            future: getImagesPopular(),
            builder: (context, snapshot) {
              String? imagepath = snapshot.data?[19].posterPath;

              return snapshot.hasData
                  ? Stack(children: [
                      Container(
                        width: double.infinity,
                        height: 420,
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            height: 330,
                            width: 330,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: const Color.fromARGB(255, 86, 84, 84),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 105,
                        left: 60,
                        child: Transform.rotate(
                          angle: -0.43,
                          child: Container(
                            height: 240,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '$baseURL$imagepath',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 101,
                        left: 190,
                        child: Transform.rotate(
                          angle: 0.4,
                          child: Container(
                            height: 240,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '$baseURL${snapshot.data?[7].posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: 123,
                        child: Container(
                          height: 270,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '$baseURL${snapshot.data?[14].posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ])
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
            }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      required this.imageList,
      this.angle = 0,
      required this.margin});

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: margin,
          width: size.width * 0.33,
          height: size.height * 0.21,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageList), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
