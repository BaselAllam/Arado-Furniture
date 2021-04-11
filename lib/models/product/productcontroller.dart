import 'package:arado/models/product/productmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

mixin ProductController on Model{

  String _domain = 'https://arado-254e9-default-rtdb.firebaseio.com/products.json';

  bool _isAddProductLoading = false;
  bool get isAddProductLoading => _isAddProductLoading;

  bool _isGetProductLoading = false;
  bool get isGetProductLoading => _isGetProductLoading;

  List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;


  Future<bool> addProduct(String title, double price, String image) async {

    _isAddProductLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'productName' : title,
      'productPrice' : price,
      'productImage' : image
    };

    try{
      http.Response _response = await http.post(
        Uri.parse(_domain),
        body: json.encode(_data),
      );

      if(_response.statusCode == 200){
        ProductModel _newProduct = ProductModel(
          '1',
          title,
          price,
          image
        );
        _allProducts.add(_newProduct);
        _isAddProductLoading = false;
        notifyListeners();
        return true;
      }else{
        _isAddProductLoading = false;
        notifyListeners();
        return false;
      }
    }catch(e){
      _isAddProductLoading = false;
      notifyListeners();
      print(e);
      return false;
    }
  }


  getProducts() async {

    _isGetProductLoading = true;
    notifyListeners();

    try{
        http.Response _response = await http.get(Uri.parse(_domain));

      var _data = json.decode(_response.body);

      _data.forEach((x, y) {
        ProductModel _newProduct = ProductModel.fromJson(y, x);
        _allProducts.add(_newProduct);
      });
      _isGetProductLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
      _isGetProductLoading = false;
      notifyListeners();
    }
  }

  String _selectedProductId;

  selectProduct(String id) {
    _selectedProductId = id;
  }

  ProductModel get selectedProduct{
    return _allProducts.firstWhere((ProductModel product) {
      return product.id == _selectedProductId;
    });
  }

}