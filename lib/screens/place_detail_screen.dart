import 'package:flutter/material.dart';
import 'package:greate_places/screens/map_screen.dart';

import '../models/places.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title.isEmpty),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            place.location.address,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MapScreen(
                  isReadOnly: true,
                  initialLocation: place.location,
                ),
                fullscreenDialog: true,
              ));
            },
            icon: const Icon(Icons.map),
            label: const Text(
              'Ver no mapa',
            ),
          ),
        ],
      ),
    );
  }
}
