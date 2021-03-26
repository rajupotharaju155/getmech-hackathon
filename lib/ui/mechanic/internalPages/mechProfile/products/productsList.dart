import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/productsModel.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/addProduct.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class ProductsList extends StatelessWidget {
  final String category;
  ProductsList({this.category});

final List<ProductModel> productList = [
  ProductModel(
    productName: "Front Mud Guard",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Back Mud Guard",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Bike Engine",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Bike Chain Cover",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Front Head Light",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Tail Light",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Front Fork Main Tube",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Side Stand",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Leg Guard",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Engine Guard",
    productPrice: 450,
    quantity: 1
  ),
  ProductModel(
    productName: "Visor",
    productPrice: 450,
    quantity: 1
  ),
];

  void _addProduct(BuildContext context){
    CommonActions.gotoPage(AddProduct(), context);
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
        onPressed: ()=> _addProduct(context),
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
                        Text(productList[index].productName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        Text("Rs."+ productList[index].productPrice.toString(),
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