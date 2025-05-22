import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled1/home_service.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/product_model.dart';

import 'home_service.dart';

class HomeController extends GetxController{

// HomeService homeService=new HomeService();

late HomeService homeService;

List<ProductModel> products=[];

List<String> categories=[];

List<ProductModel> productByCategory=[];

bool isCategoryLoading=false;

bool isLoading=false;

bool isProductByCategoryLoading=false;


@override
void onInit() {
  homeService=HomeService();
  getCategories();

  getProducts();

  super.onInit();

}



void getProducts()async{
  try {
    isLoading=true;
    update();

  http.Response response= await  homeService.getProducts();
  if(response.statusCode==200){

   var data= jsonDecode(response.body);

    for(int i=0;i<data.length;i++){
      products.add(ProductModel.fromJson(data[i]));
    }

    isLoading=false;
    update();


  }

  }catch(e) {
    print('Error in getCategories: $e');
  }
}


void getProductsByCategory(String category)async{

  try{
    isProductByCategoryLoading=true;
    update();
   http.Response response=await homeService.getProductsByCategory(category);

   var data= jsonDecode(response.body);

   for(int i=0;i<data.length;i++){

     productByCategory.add(ProductModel.fromJson(data[i]));
   }
print(productByCategory);
    isProductByCategoryLoading=false;
    update();



  }catch(e) {
    print('Error in getProductsByCategory: $e');
    isProductByCategoryLoading=true;
    update();
  }
}


void getCategories()async{
  try{

    isCategoryLoading=true;
    update();
  http.Response  response= await homeService.getCategories();
  if(response.statusCode==200){
    
    var data=jsonDecode(response.body);

    for(int i=0;i<data.length;i++){
      categories.add(data[i]);
      isCategoryLoading=false;
      update();
    }
    
  }else{
    print('Error in getCategories: $response.statusCode');
    isCategoryLoading=false;
    update();
  }

  }catch(e) {
    print('Error in getCategories: $e');
    isCategoryLoading=false;
    update();
  }
}
}