import 'package:flutter/material.dart';


class PlantDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF399D63)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Abacateiro',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Frutífera',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 185.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Image(
                  image: AssetImage('assets/whiteplant.png'),
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 355.0,
                      left: 20.0,
                      right: 15.0,
                      bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Origem',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        'América Central (Guatemala, Antilhas e México)',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Cultivo',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'O abacateiro cresce mais facilmente em solos leves, profundos, drenados e ligeiramente ácidos. As melhores condições climáticas são encontradas em regiões com chuvas em torno de 1200 milímetros anuais',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Uso',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0, ),
                      Text(
                        'Abacate faz bem pois tem propriedades benéficas, seja para a saúde do corpo que para a beleza, e isso tem sido confirmado pela ciência. O abacate é rico em gorduras “boas”, é fonte de vitamina E, um nutriente com potencial rejuvenescedor.Essa fruta é de fácil digestão, é rica em sais minerais, fornece a energia que precisamos para encarar o dia, principalmente se for consumida de manhã. As gorduras e os óleos do abacate servem também para tratamentos de beleza da pele e dos cabelos',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
