import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greate_places/providers/greate_places.dart';
import 'package:greate_places/widgets/image_input.dart';
import 'package:greate_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage = File('');
  LatLng _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage.path != null &&
        _pickedPosition != null;
  }

  void _subimitForm() {
    if (_isValidForm()) {
      return;
    }

    Provider.of<GreatPlaces>(
      context,
      listen: false,
    ).addPlace(
      _titleController.text,
      _pickedImage,
    );

    Navigator.of(context).pop();
  }

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ImageInput(this._selectImage),
          SizedBox(
            height: 10,
          ),
          LocationInput(this._selectPosition),
          ElevatedButton.icon(
            onPressed: _isValidForm() ? _subimitForm : null,
            icon: const Icon(Icons.add),
            label: const Text(
              'Adicionar',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
