class Homemodel {
  String? status;
  int? totalResults;
  Articles? articles;

  Homemodel({this.status, this.totalResults, this.articles});

  Homemodel jsonDataFromHomemodel(Map m1)
  {
    status = m1['status'];
    totalResults = m1['totalResults'];
    Articles a1 = Articles().jsonDataFromArticles(m1['articles']);
    Homemodel h1 = Homemodel(articles: a1,status: status,totalResults: totalResults);
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
