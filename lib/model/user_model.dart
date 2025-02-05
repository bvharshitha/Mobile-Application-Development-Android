class UserModel {
  // * User Details
  final String? uid;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? addressLine1;
  final String? addressLine2;
  final String? city;
  final String? landmark;
  final String? state;
  final String? pincode;
  final String profileUrl;
  final bool? accountDisable;

  UserModel({
    this.uid,
    this.userName,
    this.phoneNumber,
    this.email,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.pincode,
    this.landmark,
    this.profileUrl = '',
    this.accountDisable,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      'userName': userName,
      "phoneNumber": phoneNumber,
      'email': email,
      'profileUrl': profileUrl,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'pincode': pincode,
      'landmark': landmark,
      'accountDisable': accountDisable,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      city: map['city'],
      pincode: map['pincode'],
      state: map['state'],
      landmark: map['landmark'],
      profileUrl: map['profileUrl'],
      accountDisable: map['accountDisable'],
    );
  }
}
