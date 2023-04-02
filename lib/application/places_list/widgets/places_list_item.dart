import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_photo_and_map/application/place_detail/screens/place_detail_screen.dart';

import '../../models/place.dart';

class PlacesListItem extends StatelessWidget {
  final Place place;
  const PlacesListItem({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: FileImage(place.photo),
      ),
      title: Text(place.name),
      subtitle: Text(place.location.address ?? ''),
      onTap: () => Navigator.of(context).pushNamed(
        PlaceDetailScreen.ROUTE_NAME,
        arguments: place.id,
      ),
    );
  }
}
