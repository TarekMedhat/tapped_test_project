import 'package:tapped_test_project/features/feeds/dependencies/service_providers/feed_service_provider.dart';
import 'package:tapped_test_project/features/feeds/domain/usecases/list_feeds_usecase.dart';

class ListFeedsUsecaseProvider {
  ListFeedsUsecaseProvider._();

  static ListFeedsUsecase get() {
    return ListFeedsUsecase(
      feedService: FeedServiceProvider.get(),
    );
  }
}
