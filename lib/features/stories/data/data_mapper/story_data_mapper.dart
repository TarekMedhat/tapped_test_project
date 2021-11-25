import 'package:tapped_test_project/features/stories/data/data_models/story_data_model.dart';
import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

class StoryDataMapper {
  StoryDataMapper._();

  static List<Story> toEntities({
    required List<StoryDataModel> storyDataModels,
  }) {
    return storyDataModels
        .map((storyDataModel) => _toEntity(storyDataModel: storyDataModel))
        .toList();
  }

  static Story _toEntity({
    required StoryDataModel storyDataModel,
  }) {
    return Story(
      id: storyDataModel.id,
      author: storyDataModel.author,
      imageUrl: storyDataModel.imageUrl,
    );
  }

  static List<StoryDataModel> fromApiMapList({
    required List response,
  }) {
    return response.map((storyApiMap) {
      return _fromApiMap(map: storyApiMap as Map<String, dynamic>);
    }).toList();
  }

  static StoryDataModel _fromApiMap({
    required Map<String, dynamic> map,
  }) {
    return StoryDataModel(
      id: map['id'] as String,
      author: map['author'] as String,
      imageUrl: map['download_url'] as String,
    );
  }
}
