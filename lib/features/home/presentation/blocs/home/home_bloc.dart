import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tapped_test_project/common/apis/api_client.dart';
import 'package:tapped_test_project/features/feeds/domain/contracts/usecase_contracts/list_feeds_usecase_contract.dart';
import 'package:tapped_test_project/features/feeds/domain/entities/feed.dart';
import 'package:tapped_test_project/features/stories/domain/contracts/usecase_contracts/list_stories_usecase_contract.dart';
import 'package:tapped_test_project/features/stories/domain/entities/story.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ListStoriesUsecaseContract _listStoriesUsecase;
  final ListFeedsUsecaseContract _listFeedsUsecase;

  HomeBloc({
    required ListStoriesUsecaseContract listStoriesUsecase,
    required ListFeedsUsecaseContract listFeedsUsecase,
  })  : _listStoriesUsecase = listStoriesUsecase,
        _listFeedsUsecase = listFeedsUsecase,
        super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeLaunchedEvent) {
        await _onLaunchedEvent(event: event, emit: emit);
      }
    });
  }

  Future<void> _onLaunchedEvent({
    required HomeLaunchedEvent event,
    required Emitter<HomeState> emit,
  }) async {
    emit.call(HomeInProgressState());
    try {
      final results = await Future.wait([
        _listStoriesUsecase.list(),
        _listFeedsUsecase.list(),
      ]);
      final stories = results[0] as List<Story>;
      final feeds = results[1] as List<Feed>;
      emit.call(HomeLoadDataSuccessState(stories: stories, feeds: feeds));
    } on ApiException catch (e) {
      emit.call(HomeLoadDataFailureState(errorMessage: e.messageToBeShown));
    } catch (e) {
      emit.call(const HomeLoadDataFailureState(errorMessage: 'Something went wrong!'));
    }
  }
}
