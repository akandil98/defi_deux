import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final int commentLevel;
  final bool isDescription;
  const CommentWidget({
    super.key,
    required this.commentLevel,
    required this.isDescription,
  });

  @override
  Widget build(BuildContext context) {
    return buildNestedContainer(commentLevel);
  }

  Widget buildNestedContainer(int depth) {
    if (depth <= 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Container(
          // padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 26, 26),
            border: commentLevel < 1
                ? null
                : const Border(
                    left: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.iconColor,
                          child: Icon(
                            Icons.account_circle_rounded,
                          ),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'Practical-Stay-9674'
                      ' • '
                      '1d',
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text('Amazing'),
                if (isDescription == false)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Color.fromARGB(223, 84, 84, 84),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.subdirectory_arrow_left,
                          color: Color.fromARGB(223, 84, 84, 84),
                        ),
                        label: Text(
                          'Reply',
                          style: AppTextStyles.small14.copyWith(
                            color: const Color.fromARGB(223, 119, 119, 119),
                          ),
                        ),
                      ),
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
                          const Text('1'),
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
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 26, 26, 26),
          border: Border(
            left: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
        ),
        padding: const EdgeInsets.only(left: 10), // Border padding
        child: buildNestedContainer(depth - 1),
      );
    }
  }
}
