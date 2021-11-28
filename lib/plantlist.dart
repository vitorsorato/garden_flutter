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
          height: 350.0,
          child: ListView(
            padding: const EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard('assets/aloevera.png', '25', 'OUTDOOR', 'Aloe Vera'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/ficus.png', '25', 'INDOOR', 'Ficus'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/flowerplant.png', '25', 'INDOOR', 'Flower'),
              const SizedBox(width: 15.0),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
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

  getPlantCard(
      String imgPath, String price, String plantType, String plantName) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 325.0,
          width: 225.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFF399D63)),
            height: 250.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 10.0),
                        const Text(
                          'FROM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)),
                        ),
                        Text(
                          '\$' + price,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(width: 10.0)
                  ],
                ),
                Image(
                  image: AssetImage(imgPath),
                  height: 165.0,
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
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 25.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF8AC7A4),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFF399D63)),
                      child: Icon(Icons.wb_sunny,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF8AC7A4),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFF399D63)),
                      child: Icon(Icons.branding_watermark,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFF8AC7A4),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFF399D63)),
                      child: Icon(Icons.hot_tub,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PlantDetail()));
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration:
                            const BoxDecoration(color: Color(0xFF399D63)),
                        child: Icon(Icons.help_outline,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), color: Colors.black),
            child: const Center(
                child: Icon(Icons.shopping_cart, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
