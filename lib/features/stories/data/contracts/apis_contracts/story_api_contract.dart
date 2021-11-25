import 'package:tapped_test_project/features/stories/data/data_models/story_data_model.dart';

abstract class StoryApiContract {
  Future<List<StoryDataModel>> listStories();
}
