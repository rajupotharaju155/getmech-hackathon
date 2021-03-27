import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/products/productCategory.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/services/serviceCategory.dart';
import 'package:getmech/ui/mechanic/internalPages/mechProfile/shopDetails/shopDetails.dart';
import 'package:getmech/utils/commonActions.dart';
import 'package:getmech/utils/constants.dart';

class MechProfile extends StatefulWidget {

  @override
  _MechProfileState createState() => _MechProfileState();
}

class _MechProfileState extends State<MechProfile> {
  void gotoProductPage(){
    CommonActions.gotoPage(ProductCategory(), context);
  }

  void gotoServicePage(){
    CommonActions.gotoPage(ServiceCategory(), context);
  }

 void gotoShopPage(){
    CommonActions.gotoPage(ShopDetails(), context);
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
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
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
                              color: Colors.grey[600]
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
            ),
            SizedBox(height: 6),
            buildTile(Icons.settings_applications_sharp, "Shop details", gotoShopPage),
            buildTile(Icons.settings_input_composite, "Product details", gotoProductPage),
            buildTile(Icons.miscellaneous_services_outlined, "Service details", gotoServicePage),
            
          ]
        ),
      ),
      
    );
  }

Widget buildTile(IconData iconData, String title, Function handler){
  return Column(
    children: [
      InkWell(
        onTap: handler,
        child:
          Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
            ),
          child: ListTile(
            leading: Icon(iconData, color: secondaryColor, size: 35,),
            title: Text(title,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 20
            ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded,  color: secondaryColor, size: 15,),
          ),
        ),
      ),
      Divider(
        indent: 70,
        thickness: 2,
      ),
    ],
  );
}
}

