import 'package:tapped_test_project/features/feeds/dependencies/usecase_providers/feed_stories_usecase_provider.dart';
import 'package:tapped_test_project/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:tapped_test_project/features/stories/dependencies/usecase_providers/list_stories_usecase_provider.dart';

class HomeBlocProvider {
  HomeBlocProvider._();

  static HomeBloc get() {
    return HomeBloc(
      listStoriesUsecase: ListStoriesUsecaseProvider.get(),
      listFeedsUsecase: ListFeedsUsecaseProvider.get(),
    );
  }
}
