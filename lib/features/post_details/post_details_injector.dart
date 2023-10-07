import 'package:defi_deux/app_injector.dart';
import 'package:defi_deux/features/post_details/presentation/cubit/post_details_cubit.dart';

class PostDetailsInjector {
  static void init() {
    sl.registerFactory(() => PostDetailsCubit());

    //use cases

    //repository

    //data sources
  }
}
