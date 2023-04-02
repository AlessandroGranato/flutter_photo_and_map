import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_and_map/application/add_place/widgets/image_input.dart';
import 'package:flutter_photo_and_map/application/add_place/widgets/location_input.dart';
import 'package:flutter_photo_and_map/application/models/place.dart';
import 'package:flutter_photo_and_map/application/models/place_location.dart';
import 'package:flutter_photo_and_map/application/providers/places.dart';
import 'package:flutter_photo_and_map/application/utils/helpers/location_helper.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static String ROUTE_NAME = '/add-place-screen';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void pickImage(File imageFile) {
    _pickedImage = imageFile;
  }

  void pickLocation(PlaceLocation location) {
    _pickedLocation = location;
  }

  Future<void> savePlace() async {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    } else {
      await Provider.of<Places>(context, listen: false).addPlace(
        _titleController.text,
        _pickedImage!,
        _pickedLocation!,
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(onSelectImage: pickImage),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput(onSelectedLocation: pickLocation),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add place'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
