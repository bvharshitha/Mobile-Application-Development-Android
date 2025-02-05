import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gambolspark/constants/color_constants.dart';
import 'package:gambolspark/constants/controller_constants.dart';
import 'package:gambolspark/model/Manufacturing_Model.dart';
import 'package:gambolspark/model/my_bookingmodel.dart';
import 'package:gambolspark/model/shop_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  //*VARIABLES
  int _homeImgIndex = 0;
  int _menuIndex = 0;
  int get getHomeImgIndex => _homeImgIndex;
  int get getMenuIndex => _menuIndex;

  //*FUNCTIONS
  setHomeImgIndex(int index) {
    _homeImgIndex = index;
    update();
  }

  setMenuIndex(int index) {
    _menuIndex = index;
    update();
  }

  updateStartDate() {
    startDate = 'Start Date';
    update();
  }

  List<String> modelItemsList = [];

  void clearList() {
    modelItemsList.clear();
    update();
  }

  List<String> menuItemsList = [
    'Home',
    'Profile',
    'My Booking',
    'My Orders',
    'Logout',
  ];

  var timeSlotSelected = "".obs;
  List<String> timeSlotList = [
    "Select Time Slot",
    "8 AM - 10 Am",
    "11 AM - 1 PM",
    "2 PM - 4 PM",
    "5 PM - 7 PM",
  ];

  var getShopList = <ShopModel>[].obs;
  var getManufacturingList = <ManufacturingModel>[].obs;
  //*DATE PICKER
  DateTime? currentDate;
  DateTime? endDatetime;
  String startDate = 'Start Date';
  String endDate = 'Select Date';
  Future pickStartDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final datePicked = await showDatePicker(
        context: context,
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: ColorScheme.dark(
                    primary: primaryColor3,
                    onPrimary: black54,
                    surface: blueColor,
                  ),
                  dialogBackgroundColor: primaryColor),
              child: child!,
            ),
        initialDate: currentDate ?? initialDate,
        firstDate: (DateTime.now().subtract(Duration(days: 0))),
        lastDate: DateTime(DateTime.now().year + 1));

    if (datePicked != null) {
      currentDate = datePicked;
      startDate = DateFormat('dd.MMM.yyyy').format(currentDate!);
      update();
    }
  }

  final String apiKey =
      "T29FUHM1WW9RdFJNQVpiVkFCWmVCaFFzQ1hkN3d5WmJzeWF0YnFoZw==";
  List<String> getAllCities = [];
  String? selectedCity;
  String? selectedState;
  TextEditingController cityCtrl = TextEditingController();

  Future<List<String>?> getAllCitiesList() async {
    getAllCities.clear();
    var response = await http.get(
        Uri.parse("https://api.countrystatecity.in/v1/countries/IN/cities"),
        headers: {"X-CSCAPI-KEY": "$apiKey"});
    List<dynamic> jsonBody = json.decode(response.body);
    jsonBody.forEach((element) {
      getAllCities.add(element['name']);
      update();
    });
    update();
    getAllCities.sort();
    return getAllCities;
  }

  setStateCitySelected({required String value, required String type}) {
    if (type == "State") {
      selectedState = value;
      update();
    } else {
      selectedCity = value;

      update();
    }
  }

  dynamic idCount;
  var bookingId = ''.obs;
  Future<void> getBookingId() async {
    await getMaxValue();

    int length = idCount.toString().length;
    if (idCount == 0) {
      idCount = 1;
      bookingId.value = "MB0001";
    } else if (length == 1) {
      bookingId.value = "MB000" + idCount.toString();
    } else if (length == 2) {
      bookingId.value = "MB00" + idCount.toString();
    } else if (length == 3) {
      bookingId.value = "MB0" + idCount.toString();
    } else if (length > 3) {
      bookingId.value = "MB" + idCount.toString();
    }
    update();
  }

  Future<int> getMaxValue() async {
    print("getMaxValue");
    try {
      await db
          .collection(BOOKING_COLLECTION)
          .orderBy("idCount", descending: true)
          .limit(1)
          .get()
          .then((query) {
        if (query.docs.isEmpty) {
          return idCount = 0;
        } else {
          return idCount = query.docs[0].data()['idCount'] + 1;
        }
      });
    } catch (e) {
      print(e);
    }
    update();
    return idCount;
  }

  var getbookingList = <MyBookingModel>[].obs;
  String timeConversion(DateTime? dateTime) {
    return DateFormat('hh:mm a').format(dateTime!);
  }

  String dateConversion(DateTime? dateTime) {
    return DateFormat('dd-MMM-yyyy').format(dateTime!);
  }

  var menuTypeSelected = "".obs;
  List<String> groundList = [
    "Select",
    "Indoor",
    "Outdoor",
  ];
  List<String> ecommerceList = [
    "Select",
    "Buy Now",
    "Manufacturing",
  ];
  List<String> indoorList = [
    "Badminton",
    "Chess",
    "Table Tennis",
    "Carroms",
    "Kabaddi",
    "Swimming",
    "Bowling",
  ];
  List<String> outdoorList = [
    "Cricket",
    "Football",
    "Tennis",
    "Volley Ball",
    "Basket Ball",
  ];
}
