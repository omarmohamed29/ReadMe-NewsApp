class News {
  late List<dynamic> author;
  late String imageUrl;
  late String title;
  late String description;
  late String url;
  late DateTime publishedAt;
  late String content;
  late String keyWords;
  late List<dynamic> category ; 

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['link'];
    keyWords = json['keywords'].toString();
    author = json['creator'] ?? ['Unknown'];
    category = json['category'] ?? ['Unknown'];
    description = json['description'].toString();
    content = json['content'].toString();
    imageUrl = json['image_url'].toString();
    publishedAt = DateTime.parse(json['pubDate']);
  }
}
