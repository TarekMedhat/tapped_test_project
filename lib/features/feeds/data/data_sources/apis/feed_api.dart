import 'package:tapped_test_project/common/apis/api_client.dart';
import 'package:tapped_test_project/common/apis/api_type.dart';
import 'package:tapped_test_project/features/feeds/data/contracts/apis_contracts/feed_api_contract.dart';
import 'package:tapped_test_project/features/feeds/data/data_mapper/feed_data_mapper.dart';
import 'package:tapped_test_project/features/feeds/data/data_models/feed_data_model.dart';

class FeedApi implements FeedApiContract {
  final ApiClient _apiClient;

  const FeedApi({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<FeedDataModel>> listFeeds() async {
    final response = await _apiClient.get(
      apiType: ApiType.listFeeds,
    );
    return FeedDataMapper.fromApiMapList(response: (response as List).sublist(10));
  }
}
