import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_photo_and_map/application/add_place/screens/add_place_screen.dart';
import 'package:flutter_photo_and_map/application/places_list/widgets/places_list_item.dart';
import 'package:flutter_photo_and_map/application/providers/places.dart';
import 'package:provider/provider.dart';

import '../../models/place.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your saved places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.ROUTE_NAME),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchPlaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.error != null) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<Places>(
                builder: (context, placesData, ch) => placesData
                        .getItems.isEmpty
                    ? ch!
                    : ListView.builder(
                        itemCount: placesData.getItems.length,
                        itemBuilder: (context, index) =>
                            PlacesListItem(place: placesData.getItems[index])),
                child: const Center(
                    child: Text('No places saved yet. Start adding one!')),
              );
            }
          }
        },
      ),
    );
  }
}
