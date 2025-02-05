import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  List<ProductModel>? listOfProduct;
  var totalCartPrice = 0.obs;

  getProductList() async {
    listOfProduct = await database.getProducts();
    update();
    return listOfProduct;
  }
}
