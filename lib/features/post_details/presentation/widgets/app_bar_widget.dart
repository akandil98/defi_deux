import 'package:defi_deux/core/utils/utils.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(0.08.sh);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          size: 35,
          color: AppColors.iconColor,
        ),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.iconColor,
            child: Icon(Icons.account_circle_rounded),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(title),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      leading: Icon(
                        Icons.bookmark_border,
                      ),
                      title: Text(AppStrings.save),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.flag_outlined,
                      ),
                      title: Text(AppStrings.report),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.block_flipped,
                      ),
                      title: Text(AppStrings.blockUser),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.visibility_off_outlined,
                      ),
                      title: Text(AppStrings.hide),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications_none,
                      ),
                      title: Text(AppStrings.subscribe),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.save_alt,
                      ),
                      title: Text(AppStrings.download),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.more_vert,
          ),
        )
      ],
    );
  }
}
