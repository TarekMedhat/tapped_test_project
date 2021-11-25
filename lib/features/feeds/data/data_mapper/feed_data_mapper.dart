import 'package:tapped_test_project/features/feeds/data/data_models/feed_data_model.dart';
import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';

class FeedDataMapper {
  FeedDataMapper._();

  static List<Feed> toEntities({
    required List<FeedDataModel> feedDataModels,
  }) {
    return feedDataModels.map((feedDataModel) => _toEntity(feedDataModel: feedDataModel)).toList();
  }

  static Feed _toEntity({
    required FeedDataModel feedDataModel,
  }) {
    return Feed(
      id: feedDataModel.id,
      author: feedDataModel.author,
      imageUrl: feedDataModel.imageUrl,
    );
  }

  static List<FeedDataModel> fromApiMapList({
    required List response,
  }) {
    return response.map((feedApiMap) {
      return _fromApiMap(map: feedApiMap as Map<String, dynamic>);
    }).toList();
  }

  static FeedDataModel _fromApiMap({
    required Map<String, dynamic> map,
  }) {
    return FeedDataModel(
      id: map['id'] as String,
      author: map['author'] as String,
      imageUrl: map['download_url'] as String,
    );
  }
}
