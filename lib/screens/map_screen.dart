import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greate_places/models/places.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 37.419857,
      longitude: -122.078827,
    ),
    this.isReadOnly = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedPostion;
  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPostion = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione'),
        actions: [
          if (!widget.isReadOnly)
            IconButton(
              onPressed: _pickedPostion == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedPostion);
                    },
              icon: const Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: (_pickedPostion == null && !widget.isReadOnly)
            ? null
            : {
                Marker(
                  markerId: MarkerId('p1'),
                  position: _pickedPostion ?? widget.initialLocation.toLatLng(),
                ),
              },
      ),
    );
  }
}
