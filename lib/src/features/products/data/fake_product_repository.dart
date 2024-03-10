import 'package:ecommerce_app/src/constants/test_products.dart';

import '../domain/product.dart';

class FakeProductRepository {
  FakeProductRepository._();

  List<Product> _products = kTestProducts;

  static FakeProductRepository instance = FakeProductRepository._();

  List<Product> getProductList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  // Future For REST API
  Future<List<Product>> fetchProductList() {
    return Future.value(_products);
  }

  Future<Product> fetchProduct(String id) {
    return Future.value(_products.firstWhere((product) => product.id == id));
  }

  // Stream for Continuous Data Flow such as Firebase
  Stream<List<Product>> watchProductList() {
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductList().map((products) => products.firstWhere((product) => product.id == id));
  }
}
