import 'package:tapped_test_project/features/feeds/data/services/feed_service.dart';
import 'package:tapped_test_project/features/feeds/dependencies/api_providers/feed_api_provider.dart';

class FeedServiceProvider {
  FeedServiceProvider._();

  static FeedService get() {
    return FeedService(
      feedApiContract: FeedApiProvider.get(),
    );
  }
}
