class Product {
  String pName;
  String pPrice;
  String pLocation;
  String pDescription;
  String pCategory;
  String? pID;

  Product(
      { this.pID,
       required this.pName,
       required this.pCategory,
       required this.pDescription,
       required this.pLocation,
       required this.pPrice});
}
