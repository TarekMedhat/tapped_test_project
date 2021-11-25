import 'package:equatable/equatable.dart';

class Feed extends Equatable {
  final String id;
  final String author;
  final String imageUrl;

  const Feed({
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
