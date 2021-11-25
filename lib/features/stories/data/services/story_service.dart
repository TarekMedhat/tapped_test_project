import 'package:tapped_test_project/features/stories/data/contracts/apis_contracts/story_api_contract.dart';
import 'package:tapped_test_project/features/stories/data/data_mapper/story_data_mapper.dart';
import 'package:tapped_test_project/features/stories/domain/contracts/service_contracts/story_service_contract.dart';
import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

class StoryService implements StoryServiceContract {
  final StoryApiContract _storyApiContract;

  const StoryService({
    required StoryApiContract storyApiContract,
  }) : _storyApiContract = storyApiContract;

  @override
  Future<List<Story>> listStories() async {
    final storyDataModels = await _storyApiContract.listStories();
    return StoryDataMapper.toEntities(storyDataModels: storyDataModels);
  }
}
