class NewsModel {
  late String? newsHeading;
  late String? newsImage;
  late String? newsDesc;
  late String? newsUrl;
  late String? newsAuthor;
  late String? newsSourceName;
  NewsModel(
      {this.newsHeading,
      this.newsImage,
      this.newsDesc,
      this.newsUrl,
      this.newsAuthor,
      this.newsSourceName});

  factory NewsModel.fromMap(Map newsData) {
    return NewsModel(
      newsHeading: newsData['title'],
      newsImage: newsData['urlToImage'],
      newsDesc: newsData['description'],
      newsUrl: newsData['url'],
      newsAuthor: newsData['author'] ?? "- Anonymous -",
      newsSourceName: newsData['source']['name'],
    );
  }
}
