import 'package:flutter/material.dart';

class Lembretes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lista Básica';
    return 
      ListView(
      children: const <Widget>[
      Card(
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Regar Planta X'),
            subtitle: Text(
              'A planta X precisa ser regada as 08:00 Hrs'
            ),
          ),
        ),
      Card(
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Regar Planta Y'),
            subtitle: Text(
              'A planta Y precisa ser regada as 09:00 Hrs'
            ),
          ),
        ),
      Card(
          child: ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Regar Planta Z'),
            subtitle: Text(
              'A planta Z precisa ser regada as 10:00 Hrs'
            ),
          ),
        ),

  ],
);
  }
}