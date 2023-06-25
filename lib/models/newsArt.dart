
class NewsArt {
  String imageUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  NewsArt({
    required this.imageUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCnt,
    required this.newsUrl,
});

  static NewsArt fromApiToApp(Map<String, dynamic> article) {
    return NewsArt(
        imageUrl: article["urlToImage"] ?? "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2021/12/breaking-news-new-template-1640135286.jpg",
        newsHead: article["title"] ?? "--",
        newsDesc: article["description"] ?? "--",
        newsCnt: article["content"] ?? "--",
        newsUrl: article["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
    );
  }
}