import 'package:flutter/material.dart';
import 'package:getmech/models/mechanic/garageModel.dart';
import 'package:getmech/services/authService.dart';
import 'package:getmech/services/garageService.dart';
import 'package:getmech/ui/driver/internalPages/garageDetails.dart';
import 'package:getmech/utils/constants.dart';

class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {

  void _logout()async{
   bool result = await AuthService().logOut();
   if(result){
    //  Navigator.of(context).pop();
    print("Suvvesfully loged out");
   }else{
     print("Problem in logginf out");
   }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(title: Text("Driver Page"),
      actions: [
        ElevatedButton(onPressed: _logout, child: Text("Logout"))
      ],
      ),
      body: 
          StreamBuilder<List<GarageModel>>(
            stream: GarageService().getGarages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
              { return Center(
                child: CircularProgressIndicator(),
              );}else{
                List<GarageModel> garageModelList = snapshot.data;
              return ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index){
                  GarageModel garage = garageModelList[index];
                  return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GarageDetails(),
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/garage_1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                garage.garageName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  garage.garageAddress,
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text('2.0 KM away from you'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              });
              }
            }
          )
    
    );
  }
}
