import 'package:equatable/equatable.dart';

class StoryDataModel extends Equatable {
  final String id;
  final String author;
  final String imageUrl;

  const StoryDataModel({
    required this.id,
    required this.author,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
        id,
        author,
        imageUrl,
      ];
}
