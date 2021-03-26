import 'package:flutter/material.dart';

class GarageDetails extends StatefulWidget {
  @override
  _GarageDetailsState createState() => _GarageDetailsState();
}

class _GarageDetailsState extends State<GarageDetails>
    with SingleTickerProviderStateMixin {

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Details'),
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
                                'Honda Service Center',
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
                                  'Address to the shop is writter here blah blah blah',
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
                text: 'Products',
              ),
              Tab(
                text: 'Services',
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
                    Expanded(
                      child: Text('Services')
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Expanded(
                      child: Text('Products')
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
