import 'package:tapped_test_project/common/apis/api_client.dart';
import 'package:tapped_test_project/features/feeds/data/data_sources/apis/feed_api.dart';

class FeedApiProvider {
  FeedApiProvider._();

  static FeedApi get() {
    return FeedApi(
      apiClient: ApiClient.instance(),
    );
  }
}
