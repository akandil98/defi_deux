import 'dart:developer';

import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:defi_deux/features/post_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<PostDetailsCubit, PostDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<PostDetailsCubit>();
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: cubit.showComments
              ? null
              : const AppBarWidget(
                  title: AppStrings.appBarTitle,
                ),
          body: cubit.showComments
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
                      NotificationListener<DraggableScrollableNotification>(
                        onNotification: (notification) {
                          log(notification.toString());
                          if (notification.extent < 0.69) {
                            log('Hide');
                            cubit.showCommentsFun(showComments: false);
                          }

                          return true;
                        },
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.7,
                          minChildSize: 0.68,
                          maxChildSize: 0.99,
                          builder: (context, scrollController) {
                            scrollController.addListener(() {
                              // if () {
                              //   cubit.showCommentsFun();
                              // }
                            });
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  color: AppColors.scaffoldBackgroundColor,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(223, 24, 24, 24),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: ListView(
                                      shrinkWrap: true,
                                      controller: scrollController,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Container(
                                            width: 60,
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  223, 84, 84, 84),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          color: const Color.fromARGB(
                                              223, 35, 35, 35),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    //rank up
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.arrow_upward,
                                                        color: Color.fromARGB(
                                                            223, 84, 84, 84),
                                                      ),
                                                    ),
                                                    // score
                                                    const Text('280'),
                                                    //rank down
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.arrow_downward,
                                                        color: Color.fromARGB(
                                                            223, 84, 84, 84),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    // comments
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons
                                                            .mode_comment_outlined,
                                                        color: Color.fromARGB(
                                                            223, 84, 84, 84),
                                                      ),
                                                    ),
                                                    // comments counter
                                                    const Text('67'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    // share
                                                    IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.share,
                                                        color: Color.fromARGB(
                                                            223, 84, 84, 84),
                                                      ),
                                                    ),
                                                    const Text('42'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    // shrinkWrap: true,
                                    children: [
                                      Container(
                                        color: Colors.amber,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: 200,
                                      ),
                                      Container(
                                        color: Colors.green,
                                        height: 200,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
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
                                builder:
                                    (context, VideoPlayerValue value, child) {
                                  //Do Something with the value.
                                  return Text(
                                    "00:${value.position.inSeconds.toString().padLeft(2, '0')}",
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: Sizes.s10),
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
          floatingActionButton: cubit.showComments
              ? null
              : FloatingActionButtonWidget(
                  cubit: cubit,
                  score: 280,
                  comments: 67,
                ),
          // bottomSheet: cubit.showComments
          //     ?
          //     : null,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
