class PostCategory {
  PostCategory({
    this.id,
    this.name,
    this.theme,
  });

  String? id;
  String? name;
  int? theme;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "theme": theme,
      };
}
