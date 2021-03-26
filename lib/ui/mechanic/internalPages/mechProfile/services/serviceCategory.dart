import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/productsList.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/services/serviceList.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class ServiceCategory extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List serviceCategoryList = [
      "General Service",
      "Body Work",
      "Electrical Work",
      "Wash/Polish",
      "Tyre Service",
      "Others",
      "Breakdown Assistance",
      "Battery",

    ];

    void _goToServiceListPage(String category){
      print(category);
      CommonActions.gotoPage(ServicesList(category: category,), context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Services")
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: serviceCategoryList.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: ()=> _goToServiceListPage(serviceCategoryList[index]),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text(serviceCategoryList[index],
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