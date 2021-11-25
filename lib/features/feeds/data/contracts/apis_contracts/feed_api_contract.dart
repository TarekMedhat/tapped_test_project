import 'package:tapped_test_project/features/feeds/data/data_models/feed_data_model.dart';

abstract class FeedApiContract {
  Future<List<FeedDataModel>> listFeeds();
}
