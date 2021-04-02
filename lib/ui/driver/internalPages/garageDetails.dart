import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/garageModel.dart';
import 'package:getmech/models/mechanic/orderModel.dart';
import 'package:getmech/models/mechanic/orderRequestmodel.dart';
import 'package:getmech/models/mechanic/productsModel.dart';
import 'package:getmech/models/mechanic/serviceModel.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/services/orderService.dart';
import 'package:getmech/utils/constants.dart';
import 'package:getmech/utils/dialog.dart';
import 'package:progress_dialog/progress_dialog.dart';

class GarageDetails extends StatefulWidget {
  final GarageModel garage;
  GarageDetails({this.garage});
  
  @override
  _GarageDetailsState createState() => _GarageDetailsState();
}

class _GarageDetailsState extends State<GarageDetails>
    with SingleTickerProviderStateMixin {
        ProgressDialog pd;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
    pd = ProgressDialog(context);
    print("Garage id is: "+ widget.garage.garageId);
    print("Garage id is: "+ widget.garage.garageAddress);
    print("Garage id is: "+ widget.garage.garageName);
  }

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

  List productCategoryList = [
    "Accessories",
    "Body Parts",
    "Electrical Items",
    "Engine Parts",
    "Service Parts",
    "Wheel Parts"
  ];

  final List<ProductModel> productList = [
    ProductModel(
        productName: "Front Mud Guard", productPrice: 450, quantity: 1),
    ProductModel(productName: "Back Mud Guard", productPrice: 450, quantity: 1),
    ProductModel(productName: "Bike Engine", productPrice: 450, quantity: 1),
    ProductModel(
        productName: "Bike Chain Cover", productPrice: 450, quantity: 1),
    ProductModel(
        productName: "Front Head Light", productPrice: 450, quantity: 1),
    ProductModel(productName: "Tail Light", productPrice: 450, quantity: 1),
    ProductModel(
        productName: "Front Fork Main Tube", productPrice: 450, quantity: 1),
    ProductModel(productName: "Side Stand", productPrice: 450, quantity: 1),
    ProductModel(productName: "Leg Guard", productPrice: 450, quantity: 1),
    ProductModel(productName: "Engine Guard", productPrice: 450, quantity: 1),
    ProductModel(productName: "Visor", productPrice: 450, quantity: 1),
  ];

  final List<ServiceModel> serviceList = [
    ServiceModel(
        serviceName: "Front Mud Guard", servicePrice: 450, quantity: 1),
    ServiceModel(serviceName: "Back Mud Guard", servicePrice: 450, quantity: 1),
    ServiceModel(serviceName: "Bike Engine", servicePrice: 450, quantity: 1),
    ServiceModel(
        serviceName: "Bike Chain Cover", servicePrice: 450, quantity: 1),
    ServiceModel(
        serviceName: "Front Head Light", servicePrice: 450, quantity: 1),
    ServiceModel(serviceName: "Tail Light", servicePrice: 450, quantity: 1),
  ];

  void createOrderRequest()async{
    print("Creating order....");
    pd.style(message: "Creating order..");
    await pd.show();
    String uid = await AuthService().currrentUser();
    final List<Particulars> particularList = [
      Particulars(
        particularName: 'Basic Charges',
        isProduct: false,
        pirce: 200
      ),
      Particulars(
        particularName: 'Side Mirror',
        isProduct: true,
        pirce: 340
      ),
    ];
    String latitude = '19.78282';
    String longitude = '17.2431';
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    OrderRequestModel orderRequestModel = OrderRequestModel(
      orderRequestId: "random string",
      customerId: uid,
      garageId: widget.garage.garageId,
      orderName: "Sudden Breakdown",
      requestDate: DateTime.now(),
      isUrgent: true,
      scheduledDate: DateTime.now(),
      vehicleClassNumber: 4,
      vehicleName: "Toyota Innova",
      vehicleColor: "Grey",
      registrationNumber: "MH 47 AS1198",
      particularList: particularList,
      paymentIsOnline: true,
      requestStatus: 'pending',
      googleMapsUrl: googleUrl,
      garageAddress: widget.garage.garageName,
      garageName: widget.garage.garageName

    );

    bool res = await OrderService().createOrderRequest(orderRequestModel, );
    await pd.hide();
    if (res){
      DialogUtil().showTaskDoneDialog(context, 
      "Order Made", 
      "We have notified the garage about your request\nPlease wait for garage acknowledgment", 
      true, goBack);
    }
    print(res);


  }

  void goBack(){
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Details'),
      ),

      bottomNavigationBar: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white
          ),
          onPressed: createOrderRequest, 
          child: Container(
            child: Center(
              child: Text("Book "),
            )
          )),
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/garage_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.loose(Size.fromWidth(200)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.garage.garageName,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.loose(Size.fromWidth(200)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                   widget.garage.garageAddress,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.pin_drop,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                            SizedBox(width: 15,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: secondaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _controller,
            labelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                text: 'Services',
              ),
              Tab(
                text: 'Products',
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: ScrollPhysics(),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(child: _servicesProvided()),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(child: _productsProvided()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _servicesProvided() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: serviceCategoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(serviceCategoryList[index]),
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: serviceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(serviceList[index].serviceName),
                    trailing: Text(
                        "Rs." + serviceList[index].servicePrice.toString()),
                  );
                })
          ],
        );
      },
    );
  }

  Widget _productsProvided() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productCategoryList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(productCategoryList[index]),
          children: [
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(productList[index].productName),
                    trailing: Text(
                        "Rs." + productList[index].productPrice.toString()),
                  );
                }),
          ],
        );
      },
    );
  }
}
