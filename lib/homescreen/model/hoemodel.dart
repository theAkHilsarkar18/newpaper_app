class Homemodel {
  String? status;
  int? totalResults;
  List<Articles>? articleList = [];

  Homemodel({this.status, this.totalResults, this.articleList});

  Homemodel jsonDataFromHomemodel(Map m1)
  {
    status = m1['status'];
    totalResults = m1['totalResults'];
    List articleJsonList = m1['articles'];
    articleList = articleJsonList.map((e) => Articles().jsonDataFromArticles(e)).toList();
    Homemodel h1 = Homemodel(totalResults: totalResults,status: status,articleList: articleList);
    return h1;
  }


}

class Articles {
  Source? source;
  String? author, title, description, url, urlToImage, publishedAt, content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles jsonDataFromArticles(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    url = m1['url'];
    urlToImage = m1['urlToImage'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];
    Source s1 = Source().jsonDataFromSource(m1['source']);

    Articles a1 = Articles(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      source: s1,
    );

    return a1;
  }
}

class Source {
    String? id;
  String? name;

  Source({this.id, this.name});

  Source jsonDataFromSource(Map m1) {
    id = m1['id'];
    name = m1['name'];
    Source s1 = Source(id: id, name: name);
    return s1;
  }
}
