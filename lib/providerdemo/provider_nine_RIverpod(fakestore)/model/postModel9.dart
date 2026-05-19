
class ApiProducts9 {
  int id;
  String title;
  double price;
  String image;

  ApiProducts9({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory ApiProducts9.fromJson(Map<String, dynamic> json) => ApiProducts9(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    image: json["image"],
  );

}
