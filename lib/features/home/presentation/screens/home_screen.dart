import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapped_test_project/common/constants/app_dimensions.dart';
import 'package:tapped_test_project/common/constants/app_text_colors.dart';
import 'package:tapped_test_project/common/custom_widgets/loading/app_loader.dart';
import 'package:tapped_test_project/common/extensions/num_responsiveness_extension.dart';
import 'package:tapped_test_project/features/home/dependencies/bloc_providers/home_bloc_provider.dart';
import 'package:tapped_test_project/features/home/presentation/blocs/home/home_bloc.dart';
import 'package:tapped_test_project/features/home/presentation/screens/feed_item.dart';
import 'package:tapped_test_project/features/home/presentation/screens/home_app_bar.dart';
import 'package:tapped_test_project/features/home/presentation/screens/story_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBlocProvider.get()..add(HomeLaunchedEvent()),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (oldS, newS) => newS.runtimeType != oldS.runtimeType,
        listener: (_, state) {
          _onStateListenHandler(context: context, bloc: homeBloc, state: state);
        },
        builder: (context, state) => CustomScrollView(
          slivers: [
            const HomeAppBar(),
            if (state is HomeInProgressState) const SliverFillRemaining(child: AppLoader()),
            if (state is HomeLoadDataSuccessState)
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildStoriesSection(context: context, state: state),
                  _buildFeedsSection(context: context, state: state),
                ]),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesSection({
    required BuildContext context,
    required HomeLoadDataSuccessState state,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 8.hp(context),
            bottom: 8.hp(context),
            left: AppDimensions.horizontalPadding(context),
          ),
          child: Text(
            'Stories',
            style: TextStyle(
              fontSize: 19.sp(context),
              color: AppTextColors.white87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 220.hp(context),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.horizontalPadding(context), vertical: 4.hp(context)),
            shrinkWrap: true,
            itemCount: state.stories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => StoryItem(
              story: state.stories[index],
              index: index,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedsSection({
    required BuildContext context,
    required HomeLoadDataSuccessState state,
  }) {
    return ListView.builder(
      padding: EdgeInsets.only(
        left: AppDimensions.horizontalPadding(context),
        right: AppDimensions.horizontalPadding(context),
      ),
      primary: false,
      shrinkWrap: true,
      itemCount: state.feeds.length,
      itemBuilder: (context, index) => FeedItem(
        feed: state.feeds[index],
      ),
    );
  }

  void _onStateListenHandler({
    required BuildContext context,
    required HomeBloc bloc,
    required HomeState state,
  }) {
    if (state is HomeLoadDataFailureState) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Error", style: TextStyle(fontSize: 20.sp(context))),
                content: Text(state.errorMessage, style: TextStyle(fontSize: 16.sp(context))),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel", style: TextStyle(fontSize: 15.sp(context))),
                  ),
                  TextButton(
                    onPressed: () {
                      bloc.add(HomeLaunchedEvent());
                      Navigator.of(context).pop();
                    },
                    child: Text("Retry", style: TextStyle(fontSize: 15.sp(context))),
                  ),
                ],
              ));
    }
  }
}
