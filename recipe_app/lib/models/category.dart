class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  factory Category.fromJson(dynamic json) {
    return Category(
      id: json['_id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
