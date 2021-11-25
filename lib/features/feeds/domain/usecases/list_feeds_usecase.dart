import 'package:tapped_test_project/features/feeds/domain/contracts/service_contracts/feed_service_contract.dart';
import 'package:tapped_test_project/features/feeds/domain/contracts/usecase_contracts/list_feeds_usecase_contract.dart';
import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';

class ListFeedsUsecase implements ListFeedsUsecaseContract {
  final FeedServiceContract _feedService;

  const ListFeedsUsecase({
    required FeedServiceContract feedService,
  }) : _feedService = feedService;

  @override
  Future<List<Feed>> list() async {
    return _feedService.listFeeds();
  }
}
