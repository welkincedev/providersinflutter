class PostModal11 {
  int userId;
  int id;
  String title;
  String body;

  PostModal11({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModal11.fromJson(Map<String, dynamic> json) => PostModal11(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
