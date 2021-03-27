import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/serviceModel.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/services/addService.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class ServicesList extends StatelessWidget {
  final String category;
  ServicesList({this.category});

final List<ServiceModel> serviceList = [
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
        backgroundColor: secondaryColor,
        onPressed: ()=> _addService(context),
        tooltip: "Add Product",
        child: Center(
          child: Icon(Icons.add, color: Colors.white, size: 30,),
        ),
      ),
      body: ListView.builder(
        itemCount: serviceList.length,
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
              title: Text(serviceList[index].serviceName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
              trailing:  Text("Rs."+ serviceList[index].servicePrice.toString(),
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