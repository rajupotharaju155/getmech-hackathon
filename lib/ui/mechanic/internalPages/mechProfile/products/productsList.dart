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
        backgroundColor: secondaryColor,
        onPressed: ()=> _addProduct(context),
        tooltip: "Add Product",
        child: Center(
          child: Icon(Icons.add, color: Colors.white, size: 30,),
        ),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300])
            ),
            child: ExpansionTile(
              title: Text(productList[index].productName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
              trailing:  Text("Rs."+ productList[index].productPrice.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor
                        ),
                        ),
              children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue[600],
                              onPrimary: Colors.white
                            ),
                            onPressed: (){}, 
                            icon:  Icon(Icons.edit, size: 25,),
                            label: Text("Edit", style: TextStyle(fontWeight: FontWeight.normal))
                          ,),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[600],
                              onPrimary: Colors.white
                            ),
                            onPressed: (){}, 
                            icon:  Icon(Icons.delete, size: 25,),
                            label: Text("Delete", style: TextStyle(fontWeight: FontWeight.normal))
                          ,),
                        ),
                      ],
                    ),
                  )
              ],   
            )
          );
        }),
    );
  }
}