class ProductModel {
  final String? productId;
  final String? productName;
  final String? description;
  final String? shortDescription;
  final dynamic price;
  final dynamic rating;
  final List<String>? images;
  final String? replacement;
  final String? deliveryDate;

  ProductModel({
    this.productId,
    this.productName,
    this.description,
    this.shortDescription,
    this.price,
    this.rating,
    this.images,
    this.replacement,
    this.deliveryDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'description': description,
      'shortDescription': shortDescription,
      'price': price,
      'rating': rating,
      'images': images,
      'replacement': replacement,
      'deliveryDate': deliveryDate,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'],
      productName: map['productName'],
      description: map['description'],
      shortDescription: map['shortDescription'],
      price: map['price'],
      rating: map['rating'],
      images: List<String>.from(map['images']),
      replacement: map['replacement'],
      deliveryDate: map['deliveryDate'],
    );
  }
}
