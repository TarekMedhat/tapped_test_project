part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeInProgressState extends HomeState {}

class HomeLoadDataSuccessState extends HomeState {
  final List<Story> stories;
  final List<Feed> feeds;

  @override
  List<Object> get props => [stories, feeds];

  const HomeLoadDataSuccessState({
    required this.stories,
    required this.feeds,
  });
}

class HomeLoadDataFailureState extends HomeState {
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

  const HomeLoadDataFailureState({
    required this.errorMessage,
  });
}
