import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_photo_and_map/application/map/screens/map_screen.dart';
import 'package:flutter_photo_and_map/application/models/map_screen_arguments.dart';
import 'package:provider/provider.dart';

import '../../providers/places.dart';

class PlaceDetailScreen extends StatelessWidget {
  static String ROUTE_NAME = '/place-detail';
  const PlaceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final placeId = ModalRoute.of(context)!.settings.arguments as String;
    final place = Provider.of<Places>(context, listen: false).findById(placeId);
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: Column(children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            place.photo,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          place.location.address ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(MapScreen.ROUTE_NAME,
                    arguments: MapScreenArguments(
                      initialLocation: place.location,
                      isSelecting: false,
                    )),
            child: const Text('view on map'))
      ]),
    );
  }
}
