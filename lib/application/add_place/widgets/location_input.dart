import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_photo_and_map/application/map/screens/map_screen.dart';
import 'package:flutter_photo_and_map/application/utils/helpers/location_helper.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../models/map_screen_arguments.dart';
import '../../models/place_location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectedLocation;
  const LocationInput({super.key, required this.onSelectedLocation});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview(PlaceLocation placeLocation) {
    setState(() {
      _previewImageUrl = LocationHelper.generateLocationImagePreview(
          placeLocation.latitude, placeLocation.longitude);
    });
  }

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    final placeLocation = PlaceLocation(
        latitude: locationData.latitude!, longitude: locationData.longitude!);
    _showPreview(placeLocation);
    widget.onSelectedLocation(placeLocation);
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).pushNamed(
      MapScreen.ROUTE_NAME,
      arguments: MapScreenArguments(
        initialLocation:
            const PlaceLocation(latitude: 37.422, longitude: -122.084),
        isSelecting: true,
      ),
    ) as LatLng?;
    if (selectedLocation == null) {
      return;
    } else {
      final placeLocation = PlaceLocation(
          latitude: selectedLocation.latitude,
          longitude: selectedLocation.longitude);
      _showPreview(placeLocation);
      widget.onSelectedLocation(placeLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Use current location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select on map'),
            ),
          ],
        )
      ],
    );
  }
}
