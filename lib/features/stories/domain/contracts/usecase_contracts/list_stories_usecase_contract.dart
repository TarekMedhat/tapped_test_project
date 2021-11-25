import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

abstract class ListStoriesUsecaseContract {
  Future<List<Story>> listStories();
}
