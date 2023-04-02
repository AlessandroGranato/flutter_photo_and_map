// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_photo_and_map/application/models/place_location.dart';
import 'package:flutter_photo_and_map/application/models/map_screen_arguments.dart';
import 'package:flutter_photo_and_map/application/models/map_screen_tile_server_info.dart';
import 'package:flutter_photo_and_map/application/models/tile_server_type.dart';
import 'package:flutter_photo_and_map/application/utils/environments.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/exceptions/tile_server_type_exception.dart';

class MapScreen extends StatefulWidget {
  static String ROUTE_NAME = '/map-screen';
  final PlaceLocation initialLocation;
  final bool isSelecting;
  const MapScreen({
    Key? key,
    this.initialLocation =
        const PlaceLocation(latitude: 37.422, longitude: -122.084),
    this.isSelecting = false,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late TileServerInfo tileServerInfo;
  late LatLng _pickedLocation;

  @override
  void initState() {
    _initLocation();
    _initTileServerInfo();

    super.initState();
  }

  void _initLocation() {
    _pickedLocation = LatLng(
      widget.initialLocation.latitude,
      widget.initialLocation.longitude,
    );
  }

  void _initTileServerInfo() {
    switch (TileServerTypeExtension.tileServerTypeFromNumber(
        Environments.tileServerType)) {
      case TileServerType.GEOAPIFY:
        {
          tileServerInfo = TileServerInfo(
            apiKey: Environments.geoapifyApiKey,
            source: 'Maps: © Geoapify',
            urlTemplate:
                'https://maps.geoapify.com/v1/tile/osm-bright/{z}/{x}/{y}.png?&apiKey={apikey}',
            additionalOptionsMap: {'apikey': Environments.geoapifyApiKey},
          );
        }
        break;
      case TileServerType.THUNDERFOREST:
        {
          tileServerInfo = TileServerInfo(
            apiKey: Environments.thunderForestApiKey,
            source: '© Thunderforest | © OpenStreetMap',
            urlTemplate:
                'https://{s}.tile.thunderforest.com/{style}/{z}/{x}/{y}{r}.png?apikey={apiKey}',
            additionalOptionsMap: {
              'style': 'atlas',
              'apiKey': Environments.thunderForestApiKey,
            },
          );
        }
        break;
      case TileServerType.OPEN_STREET_MAP:
        {
          tileServerInfo = TileServerInfo(
            source: '© OpenStreetMap',
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          );
        }
        break;
      default:
        throw TileServerTypeException('Unknown TileServerType number');
    }
  }

  void _pickLocation(LatLng location) {
    if (widget.isSelecting) {
      setState(() {
        _pickedLocation = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your map'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.of(context).pop(_pickedLocation),
          )
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: _pickedLocation,
          zoom: 16,
          onTap: (tapPosition, point) => _pickLocation(point),
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: tileServerInfo.source,
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: tileServerInfo.urlTemplate,
            additionalOptions: tileServerInfo.additionalOptionsMap,
            maxZoom: 22,
            userAgentPackageName: 'com.pyrosandro',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _pickedLocation,
                width: 80,
                height: 80,

                builder: (context) => Image.asset('assets/images/custom-red-marker.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
