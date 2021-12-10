import 'package:flutter/material.dart';
import 'package:garden/plantdetail.dart';

class PlantList extends StatefulWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  late ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];

  late String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 230.0,
          child: ListView(
            padding: const EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard('assets/aloevera.png', 'OUTDOOR', 'Aloe Vera'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/ficus.png', 'INDOOR', 'Ficus'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/flowerplant.png', 'INDOOR', 'Flower'),
              const SizedBox(width: 15.0),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 20.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
            ),
          ),
        )
      ],
    );
  }

  getPlantCard(String imgPath, String plantType, String plantName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PlantDetail()));
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 230.0,
            width: 200.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFF399D63)),
              height: 250.0,
              width: 225.0,
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(imgPath),
                    height: 175.0,
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 25.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            plantType,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8AC7A4)),
                          ),
                          Text(
                            plantName,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0, top: 300.0),
            child: Container(
              height: 50.0,
              width: 50.0,
            ),
          )
        ],
      ),
    );
  }
}
