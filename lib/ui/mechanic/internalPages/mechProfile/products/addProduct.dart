import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = new TextEditingController();
    TextEditingController _price = new TextEditingController();
    
    void _addProduct(){
      print("Adding...");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
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
    );
  }
}