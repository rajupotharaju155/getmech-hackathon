import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/productsList.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List productCategoryList = [
      "Accessories",
      "Body Parts",
      "Electrical Items",
      "Engine Parts",
      "Service Parts",
      "Wheel Parts"
    ];

    void _goToProductListPage(String category){
      print(category);
      CommonActions.gotoPage(ProductsList(category: category,), context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Products")
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productCategoryList.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: ()=> _goToProductListPage(productCategoryList[index]),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text(productCategoryList[index],
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white70,),
                  ),
                ),
              ),
            );
          })
      ),
    );
  }
}