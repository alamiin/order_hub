import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:order_hub/data/model/ApiResponse.dart';
import 'package:order_hub/data/model/Field.dart';
import 'package:order_hub/data/model/FruitPrices.dart';
import 'package:order_hub/data/model/OrderForm.dart';
import 'package:order_hub/data/model/ValueMapping.dart';
import 'package:order_hub/service/app_service.dart';
import 'package:order_hub/utils/language.dart';
import 'dart:convert';
import '../data/model/Sections.dart';
import '../data/repository/order_repo.dart';

class OrderProvider with ChangeNotifier {
  final OrderRepo orderRepo;
  OrderProvider({required this.orderRepo});


  bool isLoading = false;
  String message = "";
  List<Sections> sections = [];
  List<Field> allField = [];
  List<ValueMapping> valueMapping = [];
  String formName = "";
  void fetchOrder() async {
    updateLoader(true);

      ApiResponse response = await orderRepo.getOrderForm();
      if (response.statusCode == 200){

        Map<dynamic, dynamic> map = jsonDecode(response.bodyString!);
        var orderForm = OrderForm.fromJson(map);
        if(orderForm.sections != null){
          sections = orderForm.sections!;
        }

        if(orderForm.formName != null){
          formName = orderForm.formName!;
        }


        allField = [];

        //i want to show all items in one listview. So i manage all item in one list
        sections.forEach((element) {
          if(element.fields != null){
            //this will handle title of every new section
            Field f = Field(
              id: null,
              key: "title",
              sectionKey: element.key,
              sectionName: element.name,
              properties: null,
            );
            allField.add(f);
            element.fields!.forEach((field) {
              Field f = Field(
                id: field.id,
                key: field.key,
                sectionKey: element.key,
                sectionName: element.name,
                properties: field.properties,
              );
              allField.add(f);
            });
          }
        });

        if(orderForm.valueMapping != null){
          valueMapping = orderForm.valueMapping!;
        }

      } else{
        message = "Something Went Wrong. Try Again";
      }
      updateLoader(false);

  }
  void resetOrderValue(){
    for (var i = 0; i < allField.length; i++) {
      allField[i].value = null;
    }
    notifyListeners();
  }
  void updateLoader(bool state){
    isLoading = state;
    notifyListeners();
  }



  // this variable is used for image file handling
  File? imageFile;
  void updateFile(File file){
    imageFile = file;
    notifyListeners();
  }


  //here we are loading csv file
  bool isCsvFileLoading = false;
  List<List<dynamic>>? csvData;
  List<FruitPrices> fruitPricesList = [];
  List<FruitPrices> displayFruitPricesList = [];
  void fetchCsvFile()async{
    resetDisplayList();
    if(csvData == null){
      updateCsvFileLoader(true);
      csvData = await orderRepo.getCsvData();
      //here we are creating object from csv file
      for (var i = 1; i < csvData!.length; i++) {
        FruitPrices fruitPrices = FruitPrices(
          productCode: csvData![i][0],
          fruit: csvData![i][1],
          form: csvData![i][2],
          retailPrice: csvData![i][3],
          retailPriceUnit: csvData![i][4],
          yieldd: csvData![i][5],
          cupEquivalentSize: csvData![i][6],
          cupEquivalentUnit: csvData![i][7],
          cupEquivalentPrice: csvData![i][8],
          productImage: csvData![i][9],
          searchKey: "${csvData![i][0]}${csvData![i][1]}${csvData![i][2]}${csvData![i][3]}${csvData![i][4]}${csvData![i][5]}${csvData![i][6]}${csvData![i][7]}${csvData![i][8]}",
        );
        fruitPricesList.add(fruitPrices);
      }
      updateCsvFileLoader(false);
    }
  }
  void updateCsvFileLoader(bool state){
    isCsvFileLoading = state;
    notifyListeners();
  }
  void searchInCsvFile(String searchKey){
    displayFruitPricesList = fruitPricesList.where((element) => element.searchKey!.toLowerCase().contains(searchKey.toLowerCase()) ).toList();
    if(searchKey.isEmpty){
      resetDisplayList();
    }else{
      notifyListeners();
    }
  }

  void resetDisplayList(){
    displayFruitPricesList = [];
    notifyListeners();
  }

}