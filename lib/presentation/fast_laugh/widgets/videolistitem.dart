import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/videolist.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  const VideoListItem({super.key, required this.index});

  final index;
  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _controller;
  bool volbut = false;
  late String videoPath;

  @override
  void initState() {
    super.initState;
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required videoPath}) {
    _controller = VideoPlayerController.network(videoPath)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Container(
          color: Colors.accents[widget.index % Colors.accents.length],
          child: _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              volumeControlingFunction(),
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.91-cdn.com/hub/wp-content/uploads/2023/03/john-wick-movies-ott.jpg"),
                    ),
                  ),
                  VideoActionsWidgets(icon: Icons.emoji_emotions, title: 'LOL'),
                  VideoActionsWidgets(icon: Icons.add, title: 'My List'),
                  VideoActionsWidgets(icon: Icons.share, title: 'Share'),
                  VideoActionsWidgets(icon: Icons.play_arrow, title: 'Play'),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }

  Positioned volumeControlingFunction() {
    return Positioned(
      bottom: 10,
      left: 20,
      child: GestureDetector(
          onTap: () {
            if (volbut) {
              volbut = false;
              _controller.setVolume(1);
            } else {
              volbut = true;
              _controller.setVolume(0);
            }
            setState(() {});
          },
          child:
              (volbut) ? const VolumeWidgetMute() : const VolumeWidgetPlay()),
    );
  }
}

class VideoActionsWidgets extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidgets(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}

class VolumeWidgetMute extends StatelessWidget {
  const VolumeWidgetMute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(94, 36, 36, 36),
      ),
      child: const Icon(
        Icons.volume_off,
        color: Colors.white,
      ),
    );
  }
}

class VolumeWidgetPlay extends StatelessWidget {
  const VolumeWidgetPlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(94, 36, 36, 36),
      ),
      child: const Icon(
        Icons.volume_up,
        color: Colors.white,
      ),
    );
  }
}
