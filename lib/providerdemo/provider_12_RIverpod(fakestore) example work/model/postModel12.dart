class ApiProducts12 {
  int id;
  String title;
  double price;
  String description;
  String image;
  Rating rating;

  ApiProducts12({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ApiProducts12.fromJson(Map<String, dynamic> json) => ApiProducts12(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"]?.toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}