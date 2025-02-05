import 'package:flutter/foundation.dart';

class MyBookingModel {
  final String? bookingId;
  final int? idCount;
  final DateTime? bookingDate;
  final String? shopName;
  final String? category;
  final String? description;
  final String? city;
  final String? address;
  final String? phone;
  final String? email;
  final String? contactPerson;
  final DateTime? joiningDate;
  final String? timeSlot;
  final String? customerName;
  final String? customerPhone;
  final String? paymentId;
  final dynamic paymentAmount;
  final String? paymentStatus;
  final String? uid;

  MyBookingModel({
    this.bookingId,
    this.idCount,
    this.bookingDate,
    this.shopName,
    this.category,
    this.description,
    this.contactPerson,
    this.city,
    this.address,
    this.phone,
    this.email,
    this.joiningDate,
    this.timeSlot,
    this.customerName,
    this.customerPhone,
    this.paymentId,
    this.paymentAmount,
    this.paymentStatus,
    this.uid,
  });
  Map<String, dynamic> toMap() {
    return {
      "bookingId": bookingId,
      'idCount': idCount,
      'bookingDate': bookingDate,
      "shopName": shopName,
      'description': description,
      'category': category,
      "contactPerson": contactPerson,
      "city": city,
      'address': address,
      "phone": phone,
      "email": email,
      "joiningDate": joiningDate,
      "timeSlot": timeSlot,
      "customerName": customerName,
      "customerPhone": customerPhone,
      "paymentId": paymentId,
      "paymentAmount": paymentAmount,
      "paymentStatus": paymentStatus,
      "uid": uid,
    };
  }

  factory MyBookingModel.fromMap(Map<String, dynamic> map) {
    return MyBookingModel(
      bookingId: map['bookingId'],
      idCount: map['idCount'],
      bookingDate: map['bookingDate'].toDate(),
      shopName: map['shopName'],
      description: map['description'],
      category: map['category'],
      contactPerson: map['contactPerson'],
      city: map['city'],
      address: map['address'],
      phone: map['phone'],
      email: map['email'],
      joiningDate: map['joiningDate'].toDate(),
      timeSlot: map['timeSlot'],
      customerName: map['customerName'],
      customerPhone: map['customerPhone'],
      paymentId: map['paymentId'],
      paymentAmount: map['paymentAmount'],
      paymentStatus: map['paymentStatus'],
      uid: map['uid'],
    );
  }
}
