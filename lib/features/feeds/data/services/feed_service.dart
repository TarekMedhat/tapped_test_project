import 'package:tapped_test_project/features/feeds/data/contracts/apis_contracts/feed_api_contract.dart';
import 'package:tapped_test_project/features/feeds/data/data_mapper/feed_data_mapper.dart';
import 'package:tapped_test_project/features/feeds/domain/contracts/service_contracts/feed_service_contract.dart';
import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';

class FeedService implements FeedServiceContract {
  final FeedApiContract _feedApiContract;

  const FeedService({
    required FeedApiContract feedApiContract,
  }) : _feedApiContract = feedApiContract;

  @override
  Future<List<Feed>> listFeeds() async {
    final feedDataModels = await _feedApiContract.listFeeds();
    return FeedDataMapper.toEntities(feedDataModels: feedDataModels);
  }
}
