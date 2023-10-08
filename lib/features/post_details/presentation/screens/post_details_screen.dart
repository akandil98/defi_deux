import 'package:defi_deux/core/utils/utils.dart';
import 'package:defi_deux/features/post_details/presentation/cubit/post_details_cubit.dart';
import 'package:defi_deux/features/post_details/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

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
          body: BodyWidget(
            cubit: cubit,
          ),
          floatingActionButton: cubit.showComments
              ? null
              : FloatingActionButtonWidget(
                  cubit: cubit,
                  score: 280,
                  comments: 67,
                ),
          bottomSheet: cubit.showComments ? const BottomSheetWidget() : null,
        );
      },
    );
  }
}
