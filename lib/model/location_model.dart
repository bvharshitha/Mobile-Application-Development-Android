class LocationModel {
  // * User Details
  final String? city;
  final String? address;
  final String? phone;

  LocationModel({
    this.city,
    this.address,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      "city": city,
      'address': address,
      "phone": phone,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      city: map['city'],
      address: map['address'],
      phone: map['phone'],
    );
  }
}
