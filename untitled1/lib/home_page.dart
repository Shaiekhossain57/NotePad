import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/categories_shimmar.dart';
import 'package:untitled1/home_controller.dart';
import 'package:untitled1/product_model.dart';
import 'package:untitled1/product_shimmer.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});


  HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(



        title: Text("Products",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      
      body: Column(
        children: [

          SizedBox(
            height: 40.0,
            child: GetBuilder<HomeController>(builder: (_){
            
              return homeController.isCategoryLoading? CategoriesShimmar(): ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:homeController.categories.length,
                itemBuilder:(context,index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 5),
                    child: GestureDetector(
                      onTap: (){
                        homeController.getProductsByCategory(homeController.categories[index]);
                      },
                      child: Container(

                        decoration: BoxDecoration(
                          color:Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child:Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Text(homeController.categories[index].toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                                        ),
                        ),
                      ),
                    ),
                  );
                });
            }),
          ),

SizedBox(
  height: 10.0,
),


          Expanded(
            child: GetBuilder<HomeController>(
              builder:(_){
                return  homeController.isLoading?ProductShimmer():
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0,
            
            
                    ),
                    shrinkWrap: true,
                      itemCount: homeController.products.length,
                      itemBuilder: (context,index){
                        ProductModel product=homeController.products[index];
            
                        return Card(
                          child: Column(
                            children: [
                              Image.network(product.image!,
                              height: 80.0,
                                  width:80.0,
                              fit: BoxFit.cover,),
                              SizedBox(height:8.0),
                              Text(product.title!,
                              style: TextStyle(fontSize: 18.0,
                              overflow:TextOverflow.ellipsis),
                              ),
                              SizedBox(height:7.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                                children: [
                                  Row(
                                    children: [
                                      Text('Price',style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                      Text(product.price.toString(),style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),] ,),
            
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,size: 10,),
                                      Text(product.rating!.rate.toString(),style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ],
                                  )
                                ],
                              )
            
                                    ],
                          )
                        );
            
            
            
                      }),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
