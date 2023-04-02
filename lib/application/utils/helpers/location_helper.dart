import 'package:flutter_photo_and_map/application/models/static_map_server_type.dart';
import 'package:flutter_photo_and_map/application/utils/environments.dart';
import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static String generateLocationImagePreview(double lat, double lng) {
    var staticMapServerType =
        StaticMapServerTypeExtension.staticMapServerTypeFromNumber(
            Environments.staticMapServerType);
    switch (staticMapServerType) {
      case StaticMapServerType.GEOAPIFY:
        {
          return 'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=300&center=lonlat:$lng,$lat&zoom=13&apiKey=${Environments.geoapifyApiKey}';
        }
      case StaticMapServerType.GOOGLE_MAPS:
        {
          return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=${Environments.googleMapsApiKey}&signature=${Environments.googleMapsSignature}';
        }
      case StaticMapServerType.MAP_QUEST:
        {
          return 'https://www.mapquestapi.com/staticmap/v5/map?key=${Environments.mapQuestApiKey}&center=&$lat,$lng&zoom=13&size=600,300&type=map&locations=$lat,$lng';
        }

      default:
        {
          return 'https://maps.geoapify.com/v1/staticmap?style=osm-carto&width=600&height=300&center=lonlat:$lng,$lat&zoom=13&apiKey=${Environments.geoapifyApiKey}';
        }
    }
  }

  static Future<String> generateAddressFromCoordinates(double lat, double lng) async {
    String res = '';
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    for(Placemark p in placemarks) {
      res += p.name ?? '';
    }
    return res;
  }
}
