

class ProductModel{

  String id;
  String title;
  double price;
  String image;

  ProductModel(this.id, this.title, this.price, this.image);

  factory ProductModel.fromJson(Map<String, dynamic> i, y){
    return ProductModel(
      y,
      i['productName'],
      i['productPrice'],
      i['productImage']
    );
  }
}