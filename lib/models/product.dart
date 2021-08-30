class Product {
  String pName;
  String pPrice;
  String pLocation;
  String? pDescription;
  String pCategory;
  String? pID;
  int? pQuantity;

  Product(
      {this.pID,
      this.pQuantity,
      required this.pName,
      required this.pCategory,
      this.pDescription,
      required this.pLocation,
      required this.pPrice});
}
