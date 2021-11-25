enum ApiType {
  listStories,
  listFeeds,
}

class _ServicesUrls {
  static const _serverUrl = 'https://picsum.photos';
}

extension ApiUrlExtension on ApiType {
  String get url {
    switch (this) {
      case ApiType.listStories:
        return '${_ServicesUrls._serverUrl}/v2/list?page=1&limit=10';
      case ApiType.listFeeds:
        return '${_ServicesUrls._serverUrl}/v2/list?page=1&limit=30';
    }
  }
}
