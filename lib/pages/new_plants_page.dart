import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garden/image_selection/user_image.dart';
import 'package:garden/widgets/app_toolbar.dart';

class NewPlants extends StatefulWidget {
  const NewPlants({Key? key}) : super(key: key);

  @override
  _NewPlants createState() => _NewPlants();
}

class _NewPlants extends State<NewPlants> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(title: 'Novas Plantas'),
        body: ListView(children: [
          const SizedBox(height: 15),
          UserImage(
            onFileChanged: (imageUrl) {
              setState(() {
                this.imageUrl = imageUrl;
              });
            },
          ),
        ]));
  }
}
