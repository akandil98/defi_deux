import 'dart:developer';
import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:defi_deux/features/post_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DraggableScrollableSheetWidget extends StatelessWidget {
  const DraggableScrollableSheetWidget({
    super.key,
    required this.cubit,
  });

  final PostDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
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
                            color: const Color.fromARGB(223, 84, 84, 84),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: const Color.fromARGB(223, 35, 35, 35),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  //rank up
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_upward,
                                      color: Color.fromARGB(223, 84, 84, 84),
                                    ),
                                  ),
                                  // score
                                  const Text('280'),
                                  //rank down
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      color: Color.fromARGB(223, 84, 84, 84),
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
                                      Icons.mode_comment_outlined,
                                      color: Color.fromARGB(223, 84, 84, 84),
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
                                      color: Color.fromARGB(223, 84, 84, 84),
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
                child: Container(
                  color: AppColors.scaffoldBackgroundColor,
                  child: ListView(
                    children: [
                      const CommentWidget(
                        commentLevel: 0,
                        isDescription: true,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView(
                                shrinkWrap: true,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: Sizes.s20,
                                      top: Sizes.s20,
                                    ),
                                    child: Text(AppStrings.sortCommentsBy),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Sizes.s20,
                                    ),
                                    child: Divider(),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.rocket_rounded,
                                    ),
                                    title: Text(AppStrings.best),
                                    trailing: Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.upload,
                                    ),
                                    title: Text(AppStrings.top),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.hive_outlined,
                                    ),
                                    title: Text(AppStrings.neww),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.close_fullscreen_sharp,
                                    ),
                                    title: Text(AppStrings.controversial),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.access_time,
                                    ),
                                    title: Text(AppStrings.old),
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.question_answer_outlined,
                                    ),
                                    title: Text(AppStrings.qa),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.rocket),
                              Text('BEST COMMENTS'),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 1,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 2,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 3,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 4,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 4,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 3,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 2,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 1,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 0,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 1,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 1,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s10,
                      ),
                      const CommentWidget(
                        commentLevel: 0,
                        isDescription: false,
                      ),
                      const SizedBox(
                        height: Sizes.s50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
