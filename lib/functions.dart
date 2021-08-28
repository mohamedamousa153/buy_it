import 'models/product.dart';

List<Product> getProductByCategory(String category, List<Product> allProducts) {
  List<Product> products = [];
  try {
    for (var product in allProducts) {
      if (product.pCategory == category) {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
