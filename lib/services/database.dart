import 'package:firebase_auth/firebase_auth.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/model/Manufacturing_Model.dart';
import 'package:gambolspark/model/my_bookingmodel.dart';
import 'package:gambolspark/model/order_model.dart';
import 'package:gambolspark/model/product_model.dart';
import 'package:gambolspark/model/shop_model.dart';
import 'package:gambolspark/model/user_model.dart';
import 'package:gambolspark/widgets/dialog_widget.dart';

class Database {
  void createUser(UserModel model, User _firebaseuser) async {
    await db
        .collection(USER_COLLECTION)
        .doc(_firebaseuser.uid)
        .set(model.toMap());
  }

  Stream<List<ShopModel>> getShop(String subCategoryValue) {
    print("getShop");
    return db
        .collection(SHOP_COLLECTION)
        .where("subCategory", isEqualTo: subCategoryValue)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ShopModel.fromMap(e.data())).toList());
  }

  Stream<List<ShopModel>> searchByArea(String categoryValue, String cityValue) {
    return db
        .collection(SHOP_COLLECTION)
        .where('subCategory', isEqualTo: categoryValue)
        .where('city', isEqualTo: cityValue)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ShopModel.fromMap(e.data())).toList());
  }

  void createBooking(MyBookingModel model) async {
    await db
        .collection(BOOKING_COLLECTION)
        .doc(model.bookingId)
        .set(model.toMap());
  }

  Stream<List<MyBookingModel>> getBooking() {
    return db
        .collection('booking')
        .where('uid', isEqualTo: regCtrl.firebaseUser.value?.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => MyBookingModel.fromMap(e.data())).toList());
  }

  Future<void> updateUserProfile(
    UserModel model,
  ) {
    return db
        .collection(USER_COLLECTION)
        .doc(regCtrl.firebaseUser.value?.uid)
        .update({
      'userName': model.userName,
      'email': model.email,
      'phoneNumber': model.phoneNumber,
      'addressLine1': model.addressLine1,
      'addressLine2': model.addressLine2,
      'city': model.city,
      'state': model.state,
      'pincode': model.pincode,
      'landmark': model.landmark,
    });
  }

  Future<void> uploadProfileImage(String imageUrl) {
    return db
        .collection(USER_COLLECTION)
        .doc(regCtrl.firebaseUser.value?.uid)
        .update({'profileUrl': imageUrl}).then(
            (value) => showToast(message: "Profile pic uploaded"));
  }

  Future<List<ProductModel>> getProducts() {
    return db.collection(PRODUCT_COLLECTION).get().then((event) =>
        event.docs.map((e) => ProductModel.fromMap(e.data())).toList());
  }

  void createOrder(OrderModel model) async {
    await db.collection(ORDER_COLLECTION).doc(model.orderId).set(model.toMap());
  }

  Stream<List<OrderModel>> getOrder() {
    return db
        .collection(ORDER_COLLECTION)
        .where('uid', isEqualTo: regCtrl.firebaseUser.value?.uid)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => OrderModel.fromMap(e.data())).toList());
  }

  Future<void> cancelOrder(String cancelDesc, String orderId) async {
    return db.collection('order').doc(orderId).update({
      'grandAmt': -0,
      'deliveryStatus': 'Cancelled',
      'cancelDesc': cancelDesc,
    });
  }

  Stream<List<ManufacturingModel>> getManufacturing() {
    print("getManufacturing");
    return db.collection(MANUFACTURING_COLLECTION).snapshots().map((event) =>
        event.docs.map((e) => ManufacturingModel.fromMap(e.data())).toList());
  }

  Stream<List<ManufacturingModel>> searchByCity(String cityValue) {
    return db
        .collection(MANUFACTURING_COLLECTION)
        .where('city', isEqualTo: cityValue)
        .snapshots()
        .map((event) => event.docs
            .map((e) => ManufacturingModel.fromMap(e.data()))
            .toList());
  }
}
