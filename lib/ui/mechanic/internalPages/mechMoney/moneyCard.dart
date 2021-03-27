import 'package:flutter/material.dart';
import 'package:getmech/utils/constants.dart';

class MoneyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int balance;

  const MoneyCard({Key key, this.title, this.balance, this.subtitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ListTile(
                    title: Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white
                        ),
                    ),
                    subtitle: Text(subtitle,
                    style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.white
                        ),
                    ),
                    trailing: Text("Rs. "+ balance.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white
                        ),
                        ),
                  )
                ),
              ),
            );
  }
}