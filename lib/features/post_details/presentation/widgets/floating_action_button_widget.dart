import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final int score;
  final int comments;
  const FloatingActionButtonWidget({
    super.key,
    required this.score,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        //rank up
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_upward,
            color: AppColors.iconColor,
          ),
        ),
        // score
        Text('$score'),
        //rank down
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_downward,
            color: AppColors.iconColor,
          ),
        ),
        // comments
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mode_comment_outlined,
            color: AppColors.iconColor,
          ),
        ),
        // comments counter
        Text('$comments'),
        SizedBox(
          height: 20.h,
        ),
        // share
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: AppColors.iconColor,
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
