import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String id;
  final String author;
  final String imageUrl;

  const Story({
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
