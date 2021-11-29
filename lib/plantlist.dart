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
    'Existem controvérsias na comprovação científica da eficácia ou segurança dos extratos de Aloe vera, quer para fins cosméticos ou medicinais. Pesquisas indicam provável ação positiva do extrato do gel de Aloe vera para o tratamento de diabetes, como hepatoprotetor no tratamento de diabetes tipo II assim como na redução de triglicerídeos no sangue. Uma pesquisa científica (duplo cego controlada com placebo) publicada em 1996 em 60 pacientes indicou que o extrato gel de uso tópico de Aloe vera a 0,5% apresentou afeitos positivos no tratamento da psoríase e na redução do tempo de tratamento da primeira ocorrência de herpes genital em pacientes masculinos. As indústrias de cosméticos e medicina alternativa regularmente fazem afirmações sobre as propriedades calmantes, hidratantes e curativas de Aloe vera.',
    'Alguns estudos mostram que o uso da maconha pode proporcionar diversos benefícios terapêuticos e, por isso, suas substâncias ativas, principalmente o CBD, são utilizados na medicina para o tratamento de esclerose múltipla, epilepsia, depressão ou dor crônica causada pela artrite ou fibromialgia, por exemplo. O consumo de maconha é proibido no Brasil, porém, em alguns casos, o CBD, pode ser usado para fins terapêuticos, mediante autorização específica.',
    'É consumida como chá mate (quente ou gelado). Análises e estudos sobre a erva-mate têm revelado uma composição que identifica diversas propriedades benéficas ao ser humano.',
    'Abacate faz bem pois tem propriedades benéficas, seja para a saúde do corpo que para a beleza, e isso tem sido confirmado pela ciência. O abacate é rico em gorduras “boas”, é fonte de vitamina E, um nutriente com potencial rejuvenescedor.Essa fruta é de fácil digestão, é rica em sais minerais, fornece a energia que precisamos para encarar o dia, principalmente se for consumida de manhã.',
    'A acelga pode ser consumida crua em saladas, ou cozida, refogada ou na forma de suco concentrado ou misturada com frutas ou vegetais crus. Além disso, a acelga também pode ser usada como remédio caseiro, sendo útil para tratar vários problemas de saúde.',
    'Por serem ricas em ferro, as folhas da Pereskia aculeata ajudam a curar anemias. Podem ser usadas frescas ou, secas e moídas, no preparo da farinha múltipla, complemento nutricional empregado no combate à desnutrição. Ricas em mucilagem, contribuem para o bom funcionamento do intestino.',
    'É indicada para formação de gramados residenciais, áreas industriais e campos esportivos. Também é eficaz no combate à erosão do solo e tem boa resistência ao pisoteio.',
    'Um pêssego médio pesa 75g, e de maneira geral contém 30 Cal, 7 g de carboidratos (6 g de açúcares e 1 g de fibras), 1 g de proteínas, 140 mg de potássio, e 8% das necessidades diárias de vitamina C. Nectarinas fornecem o dobro de vitamina A, e ligeiramente mais vitamina C, que os pêssegos, além de serem uma fonte mais rica de potássio.',
    'A salsa fresca é rica em vitaminas e a sua celulose ajuda o movimento intestinal. Além de seu largo uso decorativo, a salsinha provê vários benefícios à saúde. É uma boa fonte de antioxidantes (especialmente luteolina), ácido fólico, vitamina C e vitamina A. Entre os benefícios à saúde declarados estão propriedades anti-inflamatórias e melhora no sistema imune.',
    'A madeira das sequoias-gigantes maduras é altamente resistente à decomposição, mas por ser fibrosa e quebradiça, geralmente é inadequada para uso em construção civil ou marcenaria. Devido ao seu peso e fragilidade, as árvores muitas vezes estilhaçavam-se ao atingir o solo, desperdiçando grande parte da madeira. Os madeireiros tentaram amortecer o impacto cavando trincheiras e enchendo-as de ramagens. Ainda assim, estima-se que apenas 50% da madeira tenha chegado dos bosques à fábrica. A madeira era usada principalmente para revestimentos e postes de cerca, ou mesmo para palitos de fósforo.'
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
    var descIndex = (value / 200).round();
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
              getPlantCard('assets/aloevera.png', 'SUCULENTA', 'Babosa'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/cannabis.png', 'ERVA', 'Cannabis'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/erva-mate.png', 'ERVA', 'Erva-mate'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/abacate.png', 'FRUTIFERA', 'Abacateiro'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/acelga.png', 'HORTALIÇA', 'Acelga'),
              const SizedBox(width: 15.0),
              getPlantCard(
                  'assets/ora-pro-nobis.png', 'FOLHAGEM', 'Ora-pro-nóbis'),
              const SizedBox(width: 15.0),
              getPlantCard(
                  'assets/grama-esmeralda.png', 'GRAMADO', 'Grama Zóisia'),
              const SizedBox(width: 15.0),
              getPlantCard(
                  'assets/pessegueiro.png', 'FRUTIFERA', 'Pessegueiro'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/salsa.png', 'TEMPERO', 'Salsa'),
              const SizedBox(width: 15.0),
              getPlantCard('assets/sequoia.png', 'ÁRVORE', 'Sequoia'),
              const SizedBox(width: 15.0),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0, top: 20.0),
          child: Text(
            'Uso:',
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
