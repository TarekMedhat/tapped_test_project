import 'package:tapped_test_project/features/stories/domain/contracts/service_contracts/story_service_contract.dart';
import 'package:tapped_test_project/features/stories/domain/contracts/usecase_contracts/list_stories_usecase_contract.dart';
import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

class ListStoriesUsecase implements ListStoriesUsecaseContract {
  final StoryServiceContract _storyService;

  const ListStoriesUsecase({
    required StoryServiceContract storyService,
  }) : _storyService = storyService;

  @override
  Future<List<Story>> listStories() async {
    return _storyService.listStories();
  }
}
