import 'package:flutter/material.dart';
import 'package:greate_places/providers/greate_places.dart';
import 'package:greate_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, child) => greatPlaces.itemsCount == 0
            ? const Text('Nenhum local cadastrado')
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.itemByIndex(index).image,
                    ),
                  ),
                  title: Text(greatPlaces.itemByIndex(index).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
