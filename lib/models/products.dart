class Products {
  String photo;
  String name;
  String descripition;
  double price;
  String descripitionPrice;
  bool isFavorite;

  Products({
    required this.photo,
    required this.name,
    required this.descripition,
    required this.price,
    required this.descripitionPrice,
    this.isFavorite = false,
  });
}
