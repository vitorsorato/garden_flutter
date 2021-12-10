import 'package:flutter/material.dart';
import 'package:garden/pages/favourites_plants_page.dart';
import 'package:garden/pages/people_page.dart';
import 'package:garden/pages/new_plants_page.dart';
import 'package:garden/pages/notifications_page.dart';
import 'package:garden/services.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0xFF399D63);

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Drawer(
      child: Material(
        color: const Color(0xFF399D63),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 120),
            menuItem(
              text: 'Eu',
              icon: Icons.people,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white70),
            const SizedBox(height: 22),
            menuItem(
              text: 'Plantas Favoritas',
              icon: Icons.favorite_border,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 22),
            menuItem(
              text: 'Novas Plantas',
              icon: Icons.add_box_outlined,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 22),
            menuItem(
              text: 'Notificações',
              icon: Icons.notifications_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 22),
            menuItem(
              text: 'Sair',
              icon: Icons.logout_rounded,
              onClicked: () async => await loginProvider.logout(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget menuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white70;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PeoplePage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlantsFavouritesPage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NewPlantsPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NotificationsPage(),
      ));
      break;
    //   case 4:
    // Navigator.of(context).push(MaterialPageRoute(
    //   // builder: (context) => Logout(),
    // ));
    // break;
  }
}
