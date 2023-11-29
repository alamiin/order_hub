class FruitPrices {

  int? productCode;
  String? fruit;
  String? form;
  dynamic retailPrice;
  String? retailPriceUnit;
  dynamic yieldd;
  dynamic cupEquivalentSize;
  String? cupEquivalentUnit;
  dynamic cupEquivalentPrice;
  String? productImage;
  String? searchKey;

  FruitPrices({
      this.productCode, 
      this.fruit, 
      this.form, 
      this.retailPrice, 
      this.retailPriceUnit, 
      this.yieldd,
      this.cupEquivalentSize, 
      this.cupEquivalentUnit, 
      this.cupEquivalentPrice, 
      this.productImage,
      this.searchKey
  });

  FruitPrices.fromJson(Map<dynamic, dynamic> json) {
    productCode = json['productCode'];
    fruit = json['fruit'];
    form = json['form'];
    retailPrice = json['retailPrice'];
    retailPriceUnit = json['retailPriceUnit'];
    yieldd = json['yield'];
    cupEquivalentSize = json['cupEquivalentSize'];
    cupEquivalentUnit = json['cupEquivalentUnit'];
    cupEquivalentPrice = json['cupEquivalentPrice'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productCode'] = productCode;
    map['fruit'] = fruit;
    map['form'] = form;
    map['retailPrice'] = retailPrice;
    map['retailPriceUnit'] = retailPriceUnit;
    map['yield'] = yieldd;
    map['cupEquivalentSize'] = cupEquivalentSize;
    map['cupEquivalentUnit'] = cupEquivalentUnit;
    map['cupEquivalentPrice'] = cupEquivalentPrice;
    map['productImage'] = productImage;
    return map;
  }

}