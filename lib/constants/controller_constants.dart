/*import 'package:baycrane/controller/auth_controller.dart';
import 'package:baycrane/controller/home_controller.dart';
import 'package:baycrane/controller/reg_controller.dart';
import 'package:baycrane/services/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


final AuthController authCtrl = AuthController.instance;

final HomeController homeCtrl = HomeController.instance;

const String Equipment_COLLECTION = 'equipmentGuide';
const String Location_COLLECTION = 'location';*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gambolspark/controller/home_controller.dart';
import 'package:gambolspark/controller/order_controller.dart';
import 'package:gambolspark/controller/product_controller.dart';
import 'package:gambolspark/controller/reg_controller.dart';
import 'package:gambolspark/services/database.dart';
import 'package:gambolspark/widgets/product_holder.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
Database database = Database();
final RegController regCtrl = RegController.instance;
final HomeController homeCtrl = HomeController.instance;
final ProductController productCtrl = ProductController.instance;
final OrderController orderCtrl = OrderController.instance;

const String USER_COLLECTION = 'users';
const String BOOKING_COLLECTION = 'booking';
const String SHOP_COLLECTION = 'shop';
const String PRODUCT_COLLECTION = 'product';
const String ORDER_COLLECTION = 'order';
const String MANUFACTURING_COLLECTION = 'manufacturing';
