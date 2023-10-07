import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class UserAvatarAndNameWidget extends StatelessWidget {
  final String userName;
  const UserAvatarAndNameWidget({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.s10,
        horizontal: Sizes.s10,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.iconColor,
            child: Icon(
              Icons.account_circle_rounded,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(userName),
        ],
      ),
    );
  }
}
