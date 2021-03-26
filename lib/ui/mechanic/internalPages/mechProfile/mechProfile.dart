import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/productCategory.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class MechProfile extends StatelessWidget {

  void gotoProductPage(BuildContext context){
    CommonActions.gotoPage(ProductCategory(), context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //pro pic and name
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kDisabledColor
                  )
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //pic
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kDisabledColor)
                      ),
                      child: FlutterLogo(
                        size: 100,
                      )
                    ),
                  ),
                  //name
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Diamond Bike Point",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          ),
                          SizedBox(height: 8),
                          Text("129,Opp McDonalds, Link Road, Near Don Bosco School",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: kDisabledColor
                          ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text("Edit Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.purple[600]
                                ),
                                ),
                              ),
                              GestureDetector(
                                child: Text("Verify Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.purple[600]
                                ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  )
                ],
              )
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(Icons.settings_applications_sharp, color: Colors.grey[600], size: 35,),
              title: Text("Shop Details",
              style: TextStyle(
                color: kDisabledColor,
                fontSize: 20
              ),
              ),
            ),
            Divider(
             indent: 70,
             thickness: 2,
            ),
            InkWell(
              onTap: ()=> gotoProductPage(context),
              child: ListTile(
                leading: Icon(Icons.settings_input_composite, color: Colors.grey[600], size: 35,),
                title: Text("Product Details",
                style: TextStyle(
                  color: kDisabledColor,
                  fontSize: 20
                ),
                ),
              ),
            ),
            Divider(
             indent: 70,
             thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.miscellaneous_services_outlined, color: Colors.grey[600], size: 35,),
              title: Text("Service Details",
              style: TextStyle(
                color: kDisabledColor,
                fontSize: 20
              ),
              ),
            ),
            Divider(
             indent: 70,
             thickness: 2,
            ),
          ]
        ),
      ),
      
    );
  }
}