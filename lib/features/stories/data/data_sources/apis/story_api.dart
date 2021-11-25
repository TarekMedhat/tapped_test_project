import 'package:tapped_test_project/common/apis/api_client.dart';
import 'package:tapped_test_project/common/apis/api_type.dart';
import 'package:tapped_test_project/features/stories/data/contracts/apis_contracts/story_api_contract.dart';
import 'package:tapped_test_project/features/stories/data/data_mapper/story_data_mapper.dart';
import 'package:tapped_test_project/features/stories/data/data_models/story_data_model.dart';

class StoryApi implements StoryApiContract {
  final ApiClient _apiClient;

  const StoryApi({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<StoryDataModel>> listStories() async {
    final response = await _apiClient.get(
      apiType: ApiType.listStories,
    );
    return StoryDataMapper.fromApiMapList(response: response);
  }
}
