class UserModel {
  // * User Details
  final String? uid;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String profileUrl;
  final bool? accountDisable;

  UserModel({
    this.uid,
    this.userName,
    this.phoneNumber,
    this.email,
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
      'accountDisable': accountDisable,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      profileUrl: map['profileUrl'],
      accountDisable: map['accountDisable'],
    );
  }
}
