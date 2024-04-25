class News {
  final List<Article> articles;

  const News({
    required this.articles,
  });

  Map<String, dynamic> toMap() {
    return {
      'articles': this.articles,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      //クラスがネストされている場合のfromMapのハンド修正
      articles: (map['articles'] as List<dynamic>)
          .map((e) => Article.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Article {
  final String? title;
  final String? description;

  const Article({
    this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] as String,
      description: (map['description'] != null) ? map['description'] as String: null,
    );
  }
}
