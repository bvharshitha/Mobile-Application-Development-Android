/*import 'package:baycrane/controller/auth_controller.dart';
import 'package:baycrane/controller/home_controller.dart';
import 'package:baycrane/controller/reg_controller.dart';
import 'package:baycrane/services/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;
Database database = Database();
final AuthController authCtrl = AuthController.instance;

final HomeController homeCtrl = HomeController.instance;
const String USER_COLLECTION = 'users';
const String Equipment_COLLECTION = 'equipmentGuide';
const String Location_COLLECTION = 'location';*/
import 'package:gambolspark/controller/reg_controller.dart';

final RegController regCtrl = RegController.instance;