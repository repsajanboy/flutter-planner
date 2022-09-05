class Category {
  Category({
    required this.id,
    required this.name,
    required this.theme,
  });
  String id;
  String name;
  int theme;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        theme: json["theme"],
      );
}
