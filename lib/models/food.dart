class Food {
  String name;
  String price;
  String imagePath;
  String rating;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  // ignore: unused_element
  String get _name => name;
  // ignore: unused_element
  String get _price => price;
  // ignore: unused_element
  String get _imagePath => imagePath;
  // ignore: unused_element
  String get _rating => rating;

}