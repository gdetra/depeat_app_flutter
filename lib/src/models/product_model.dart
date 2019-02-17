class Product{
  String _name;
  double _price;
  int _quantity;
  String _urlImage;

  Product.fromJson(Map<String, dynamic> json)
    : _name = json["name"],
      _price = json["price"].toDouble(),
      _quantity = 0,
      _urlImage = json["image_urg"];

  String get name => _name;

  double get price => _price;

  String get urlImage => _urlImage;

  int get quantity => _quantity;

  increaseQuantity(){
    _quantity++;
  }

  decreaseQuantity(){
    if(_quantity > 0){
      _quantity--;
    }
  }


}
