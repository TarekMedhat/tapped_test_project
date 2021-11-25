import 'package:tapped_test_project/features/stories/dependencies/service_providers/story_service_provider.dart';
import 'package:tapped_test_project/features/stories/domain/usecases/list_stories_usecase.dart';

class ListStoriesUsecaseProvider {
  ListStoriesUsecaseProvider._();

  static ListStoriesUsecase get() {
    return ListStoriesUsecase(
      storyService: StoryServiceProvider.get(),
    );
  }
}
