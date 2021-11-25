import 'package:tapped_test_project/features/stories/data/services/story_service.dart';
import 'package:tapped_test_project/features/stories/dependencies/api_providers/story_api_provider.dart';

class StoryServiceProvider {
  StoryServiceProvider._();

  static StoryService get() {
    return StoryService(
      storyApiContract: StoryApiProvider.get(),
    );
  }
}
