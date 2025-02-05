import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/model/order_model.dart';
import 'package:gambolspark/view/myOrder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  dynamic orderIdCount;
  dynamic itemidCount;
  var orderId = ''.obs;
  var orderItemId = ''.obs;
  var orderType = 'COD'.obs;
  //var getOrderList = <OrderModel>[].obs;
  var paymentTypeValue = 'COD'.obs;

  dynamic idCount;
  var uuid = Uuid();
  // String orderItewId;

  var gstAmtValue = 0.0.obs;
  var deliveryAmtValue = 100.obs;
  var grandAmtValue = 0.0.obs;
  var deliveryStatusValue = 'Ordered'.obs;
  var deliveryDate = "".obs;
  RxDouble totalPrice = 0.0.obs;

  //Buy now String image;
  var productImage = ''.obs;
  var productName = ''.obs;
  var productQuantity = 0.obs;
  var productCost = 0.0.obs;
  var productId = ''.obs;
  var productPrice = 0.0.obs;
  var getOrderList = <OrderModel>[].obs;
  //Buy Now
  //var getOrderList = <OrderItemModel>[].obs;
  var cancellationSelected = '--select option--'.obs;

  void increaseQuantity() {
    if (productQuantity.value < 5) {
      productQuantity.value++;
      productCost.value = productPrice.value * productQuantity.value;
      calculateGrandAmt();
    } else {
      Get.snackbar("Sorry", "You can not add more than 5 items",
          backgroundColor: greyTextColor);
    }
  }

  void decreaseQuantity() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
      productCost.value = productPrice.value * productQuantity.value;
      calculateGrandAmt();
    } else {
      Get.snackbar("Sorry", "Product Item Quantity Can not be less than 0",
          backgroundColor: greyTextColor);
    }
  }

  calculateGrandAmt() {
    double gstPrice = 18 / 100;
    double gstVal;
    totalPrice.value = productCost.value;
    gstVal = double.parse((gstPrice * productCost.value).toStringAsFixed(2));
    gstAmtValue = RxDouble(gstVal);
    grandAmtValue =
        RxDouble(totalPrice.value + gstAmtValue.value + deliveryAmtValue.value);
  }

  Future<void> createOrder(String paymentId) async {
    await getPostId();
    OrderModel orderModel = OrderModel(
      uid: regCtrl.firebaseUser.value?.uid,
      orderId: orderId.value,
      idCount: orderIdCount,
      customerName: regCtrl.firestoreUser.value?.userName,
      pincode: regCtrl.firestoreUser.value?.pincode,
      addressLine1: regCtrl.firestoreUser.value?.addressLine1,
      addressLine2: regCtrl.firestoreUser.value?.addressLine2,
      landmark: regCtrl.firestoreUser.value?.landmark,
      city: regCtrl.firestoreUser.value?.city,
      state: regCtrl.firestoreUser.value?.state,
      phoneNumber: regCtrl.firestoreUser.value?.phoneNumber,
      email: regCtrl.firestoreUser.value?.email,
      image: productImage.value,
      productName: productName.value,
      quantity: productQuantity.value,
      productId: productId.value,
      price: productPrice.value,
      paymentId: paymentId,
      paymentType: paymentTypeValue.value,
      totalAmt: totalPrice.value,
      gstAmt: gstAmtValue.value,
      deliveryAmt: deliveryAmtValue.value,
      grandAmt: grandAmtValue.value,
      orderDate: DateTime.now(),
      deliveryDate: deliveryDate.value,
      deliveryStatus: 'Placed Order',
      cancelDesc: '',
    );
    database.createOrder(orderModel);
    Get.offAll(() => MyOrderPage());
  }

  Future<void> getPostId() async {
    await getMaxValue();
    int length = orderIdCount.toString().length;
    if (orderIdCount == 0) {
      orderIdCount = 1;
      orderId = RxString("INV0001");
    } else if (length == 1) {
      orderId = RxString("INV000" + orderIdCount.toString());
    } else if (length == 2) {
      orderId = RxString("INV00" + orderIdCount.toString());
    } else if (length == 3) {
      orderId = RxString("INV0" + orderIdCount.toString());
    } else if (length > 3) {
      orderId = RxString("INV" + orderIdCount.toString());
    }
    update();
  }

  Future<int> getMaxValue() async {
    try {
      await db
          .collection(ORDER_COLLECTION)
          .orderBy("idCount", descending: true)
          .limit(1)
          .get()
          .then((query) {
        if (query.docs.isEmpty) {
          return orderIdCount = 0;
        } else {
          return orderIdCount = query.docs[0].data()['idCount'] + 1;
        }
      });
    } catch (e) {
      print(e);
    }
    update();
    return orderIdCount;
  }

  var cancelTypeSelected = '--Select Option--'.obs;

  final List<String> cancelList = [
    '--Select Option--',
    'You are not going to be available in town',
    'Delay in shipping',
    'Product is not required anymore',
    'Product is being delivered to a wrong address',
    'Cheaper alternative available for lesser price',
  ];
}
