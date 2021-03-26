import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = new TextEditingController();
    TextEditingController _price = new TextEditingController();
      final _formKey = GlobalKey<FormState>();
      List productCategoryList = [
      "Accessories",
      "Body Parts",
      "Electrical Items",
      "Engine Parts",
      "Service Parts",
      "Wheel Parts"
    ];
  String _selectedCategory; // Option 2
    
    void _addProduct(){
      print("Adding...");
    }

    void updateDropDown(String newValue){
      setState(() {
          print(newValue);
          _selectedCategory = newValue;
        });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                 //relation dropdown fileld
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300])
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            child: Text("Choose Category",
                                style: TextStyle(fontSize: 14,
                                color: primaryColor
                                )),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton(
                            underline: SizedBox(),
                            hint: Text("Select Category"), // Not necessary for Option 1
                            value: _selectedCategory,
                            onChanged: (newValue) {
                              updateDropDown(newValue);
                            },
                            items: productCategoryList.map((relation) {
                              return DropdownMenuItem(
                                child: new Text(
                                  relation,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22,
                                      color: secondaryColor),
                                ),
                                value: relation,
                              );
                            }).toList(),
                          ),
                        ),
                    
                      ],
                    ),
                  ),
                Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300])
                ),

                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    disabledBorder: InputBorder.none ),
                  controller: _name,
                  // keyboardType: TextInputType.phone,
                ),
                ),
                Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300])
                ),

                child: TextField(
                  controller: _price,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefix: Text("Rs. "),
                    labelText: "Unit Price",
                    disabledBorder: InputBorder.none ),
                ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _addProduct, 
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.green
                      ),
                      child: Center(child: Text("Submit")),
                    )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}