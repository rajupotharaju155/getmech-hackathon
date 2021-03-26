import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/productsModel.dart';
import 'package:getmech/models/mechanic/serviceModel.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/addProduct.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/services/addService.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class ServicesList extends StatelessWidget {
  final String category;
  ServicesList({this.category});

final List<ServiceModel> productList = [
  ServiceModel(
    serviceName: "Front Mud Guard",
    servicePrice: 450,
    quantity: 1
  ),
  ServiceModel(
    serviceName: "Back Mud Guard",
    servicePrice: 450,
    quantity: 1
  ),
  ServiceModel(
    serviceName: "Bike Engine",
    servicePrice: 450,
    quantity: 1
  ),
  ServiceModel(
    serviceName: "Bike Chain Cover",
    servicePrice: 450,
    quantity: 1
  ),
  ServiceModel(
    serviceName: "Front Head Light",
    servicePrice: 450,
    quantity: 1
  ),
  ServiceModel(
    serviceName: "Tail Light",
    servicePrice: 450,
    quantity: 1
  ),

];

  void _addService(BuildContext context){
    CommonActions.gotoPage(AddService(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category,
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: secondaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _addService(context),
        tooltip: "Add Product",
        child: Center(
          child: Icon(Icons.add, color: secondaryColor, size: 30,),
        ),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 100,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300])
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(productList[index].serviceName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("Rs."+ productList[index].servicePrice.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.3,
                  color: secondaryColor,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red[300], size: 25,),
                              Text("Delete", style: TextStyle(fontWeight: FontWeight.normal),)
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(Icons.edit, color: Colors.purple[200], size: 25,),
                              Text("Edit", style: TextStyle(fontWeight: FontWeight.normal),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]
              
            ),
          );
        }),
    );
  }
}