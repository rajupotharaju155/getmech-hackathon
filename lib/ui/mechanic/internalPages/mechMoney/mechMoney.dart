import 'package:flutter/material.dart';
import 'package:getmech/ui/mechanic/internalPages/mechMoney/moneyCard.dart';
import 'package:getmech/utils/constants.dart';

class MechMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mech Money"),
      ),
      body: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            MoneyCard(title: "Mech Money", subtitle: "Tap to withdraw", balance: 500,),
            MoneyCard(title: "Due Wallet",subtitle: "Tap to settle", balance: 300,),
            Divider(thickness: 3,),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ListTile(
                    title: Text("Bank Details",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white70,),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ListTile(
                    title: Text("Help",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white70,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}