import 'package:flutter/material.dart';
import 'package:garden/plantlist.dart';

import 'lembretes.dart';
import 'navigationdrawerwidget.dart';

const primaryColor = Color(0xFF399D63);

class Garden extends StatelessWidget {
  const Garden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('ABP Soluções Mobile'),
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 15.0),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: Text(
                'Garden',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                isScrollable: true,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'Plantas',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Lembretes',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: MediaQuery.of(context).size.height - 200.0,
              child: TabBarView(
                controller: tabController,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const PlantList(),
                  Lembretes(),
                  const PlantList(),
                  const PlantList()
                ],
              ),
            )
          ],
        ));
  }
}
