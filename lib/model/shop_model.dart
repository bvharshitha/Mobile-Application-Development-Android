class ShopModel {
  // * Shop  Details
  final String? shopName;
  final String? category;
  final String? subCategory;
  final String? description;
  final String? city;
  final String? address;
  final String? phone;
  final String? email;
  final dynamic fees;
  final String? contactPerson;

  ShopModel({
    this.shopName,
    this.category,
    this.subCategory,
    this.description,
    this.contactPerson,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.fees,
  });

  Map<String, dynamic> toMap() {
    return {
      "shopName": shopName,
      'description': description,
      'category': category,
      'subCategory': subCategory,
      "contactPerson": contactPerson,
      "city": city,
      'address': address,
      "phone": phone,
      "email": email,
      "fees": fees,
    };
  }

  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      shopName: map['shopName'],
      description: map['description'],
      category: map['category'],
      subCategory: map['subCategory'],
      contactPerson: map['contactPerson'],
      city: map['city'],
      address: map['address'],
      phone: map['phone'],
      email: map['email'],
      fees: map['fees'],
    );
  }
}
