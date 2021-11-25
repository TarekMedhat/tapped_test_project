import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';

abstract class FeedServiceContract {
  Future<List<Feed>> listFeeds();
}
