import 'package:equatable/equatable.dart';

class FeedDataModel extends Equatable {
  final String id;
  final String author;
  final String imageUrl;

  const FeedDataModel({
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
