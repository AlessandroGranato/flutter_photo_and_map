import 'package:flutter/foundation.dart';
import '../utils/exceptions/static_map_server_type_exception.dart';

enum StaticMapServerType {
  GEOAPIFY,
  GOOGLE_MAPS,
  MAP_QUEST,
}

extension StaticMapServerTypeExtension on StaticMapServerType {
  String get getName => describeEnum(this);

  static StaticMapServerType? staticMapServerTypeFromName(String name) {
    switch (name) {
      case 'GEOAPIFY':
        return StaticMapServerType.GEOAPIFY;
      case 'GOOGLE_MAPS':
        return StaticMapServerType.GOOGLE_MAPS;
      case 'MAP_QUEST':
        return StaticMapServerType.MAP_QUEST;
      default:
        throw StaticMapServerTypeException('Unknown StaticMapServerType name');
    }
  }

  static StaticMapServerType? staticMapServerTypeFromNumber(int number) {
    switch (number) {
      case 0:
        return StaticMapServerType.GEOAPIFY;
      case 1:
        return StaticMapServerType.GOOGLE_MAPS;
      case 2:
        return StaticMapServerType.MAP_QUEST;
      default:
        throw StaticMapServerTypeException('Unknown StaticMapServerType number');
    }
  }
}
