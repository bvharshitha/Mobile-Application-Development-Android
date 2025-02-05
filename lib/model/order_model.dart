import 'dart:convert';
import 'dart:math';

class OrderModel {
  final String? orderId;
  final int? idCount;
  final String? uid;
  final String? customerName;
  final String? pincode;
  final String? addressLine1;
  final String? addressLine2;
  final String? landmark;
  final String? city;
  final String? state;
  final String? phoneNumber;
  final String? email;

  final String? image;
  final String? productName;
  final int? quantity;
  final String? productId;
  final dynamic price;
  final String? deliveryDate;

  final String? paymentType;
  final String? paymentId;
  final dynamic totalAmt;
  final dynamic gstAmt;
  final dynamic deliveryAmt;
  final dynamic grandAmt;
  final DateTime? orderDate;
  final String? deliveryStatus;
  final String? cancelDesc;

  OrderModel({
    this.orderId,
    this.idCount,
    this.uid,
    this.customerName,
    this.pincode,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.state,
    this.phoneNumber,
    this.email,
    this.image,
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.deliveryDate,
    this.paymentType,
    this.paymentId,
    this.grandAmt,
    this.deliveryAmt,
    this.deliveryStatus,
    this.gstAmt,
    this.orderDate,
    this.totalAmt,
    this.cancelDesc,
  });
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'orderId': orderId,
      'idCount': idCount,
      'customerName': customerName,
      'pincode': pincode,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'landmark': landmark,
      'city': city,
      'state': state,
      'phoneNumber': phoneNumber,
      'email': email,
      'image': image,
      'productName': productName,
      'quantity': quantity,
      'productId': productId,
      'price': price,
      'deliveryDate': deliveryDate,
      'paymentType': paymentType,
      'paymentId': paymentId,
      'totalAmt': totalAmt,
      'gstAmt': gstAmt,
      'deliveryAmt': deliveryAmt,
      'grandAmt': grandAmt,
      'orderDate': orderDate,
      'deliveryStatus': deliveryStatus,
      'cancelDesc': cancelDesc,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        uid: map['uid'],
        orderId: map['orderId'],
        idCount: map['idCount'],
        customerName: map['customerName'],
        pincode: map['pincode'],
        addressLine1: map['addressLine'],
        addressLine2: map['addressLine2'],
        landmark: map['landmark'],
        city: map['city'],
        state: map['state'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        image: map['image'],
        productName: map['productName'],
        quantity: map['quantity'],
        productId: map['productId'],
        price: map['price'],
        deliveryDate: map['deliveryDate'],
        paymentType: map['paymentType'],
        paymentId: map['paymentId'],
        totalAmt: map['totalAmt'],
        gstAmt: map['gstAmt'],
        deliveryAmt: map['deliveryAmt'],
        grandAmt: map['grandAmt'],
        orderDate: map['orderDate'].toDate(),
        deliveryStatus: map['deliveryStatus'],
        cancelDesc: map['cancelDesc']);
  }
  String toJson() => json.encode(toMap());
  factory OrderModel.fromjson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
