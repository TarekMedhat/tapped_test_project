import 'package:tapped_test_project/common/apis/api_client.dart';
import 'package:tapped_test_project/features/stories/data/data_sources/apis/story_api.dart';

class StoryApiProvider {
  StoryApiProvider._();

  static StoryApi get() {
    return StoryApi(
      apiClient: ApiClient.instance(),
    );
  }
}
