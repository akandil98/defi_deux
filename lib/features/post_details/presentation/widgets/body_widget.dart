import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:defi_deux/features/post_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BodyWidget extends StatefulWidget {
  final PostDetailsCubit cubit;
  const BodyWidget({super.key, required this.cubit});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
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
    return widget.cubit.showComments
        ? SafeArea(
            child: Stack(
              children: [
                Stack(
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            // aspectRatio: 1,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(
                                  0.5,
                                ),
                              ),
                              child: IconButton(
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
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(
                                  0.5,
                                ),
                              ),
                              child: Center(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DraggableScrollableSheetWidget(cubit: widget.cubit),
              ],
            ),
          )
        : Column(
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
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
