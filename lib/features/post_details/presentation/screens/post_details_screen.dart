import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late VideoPlayerController _controller;
  bool isMusicOn = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(AppStrings.videoUrl));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(
        title: AppStrings.appBarTitle,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // aspectRatio: 1,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserAvatarAndNameWidget(
                  userName: AppStrings.userName,
                ),
                const DescriptionWidget(
                  description: AppStrings.videoDescription,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: AppColors.iconColor,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                          playedColor: AppColors.iconColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ValueListenableBuilder(
                      valueListenable: _controller,
                      builder: (context, VideoPlayerValue value, child) {
                        //Do Something with the value.
                        return Text(
                          "00:${value.position.inSeconds.toString().padLeft(2, '0')}",
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Sizes.s10),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isMusicOn == false
                                ? _controller.setVolume(0.0)
                                : _controller.setVolume(1.0);
                            isMusicOn = !isMusicOn;
                          });
                        },
                        icon: Icon(
                          isMusicOn == true
                              ? Icons.volume_up
                              : Icons.volume_off,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButtonWidget(
        score: 280,
        comments: 67,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
