import 'package:flutter/material.dart';
import 'package:garden/authentication.dart';
import 'package:garden/plantlist.dart';
import 'package:garden/services.dart';
import 'package:provider/provider.dart';

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
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
        body: ListView(
      children: <Widget>[
        const SizedBox(height: 15.0),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              FloatingActionButton(
                  onPressed: () async => await loginProvider.logout(),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  mini: true,
                  elevation: 0.0,
                  child: const Icon(Icons.shopping_cart,
                      color: Colors.black, size: 17.0)),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
            'Top Picks',
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
                  'Top',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Outdoor',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Indoor',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Plants',
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
              const PlantList(),
              const PlantList(),
              const PlantList()
            ],
          ),
        )
      ],
    ));
  }
}
