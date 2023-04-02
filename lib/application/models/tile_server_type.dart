import 'package:flutter/foundation.dart';
import '../utils/exceptions/tile_server_type_exception.dart';

enum TileServerType {
  OPEN_STREET_MAP,
  THUNDERFOREST,
  GEOAPIFY
}

extension TileServerTypeExtension on TileServerType {
  String get getName => describeEnum(this);

  static TileServerType? tileServerTypeFromName(String name) {
    switch (name) {
      case 'GEOAPIFY':
        return TileServerType.GEOAPIFY;
      case 'THUNDERFOREST':
        return TileServerType.THUNDERFOREST;
      case 'MAP_QUEST':
        return TileServerType.OPEN_STREET_MAP;
      default:
        throw TileServerTypeException('Unknown TileServerType name');
    }
  }

  static TileServerType? tileServerTypeFromNumber(int number) {
    switch (number) {
      case 0:
        return TileServerType.GEOAPIFY;
      case 1:
        return TileServerType.THUNDERFOREST;
      case 2:
        return TileServerType.OPEN_STREET_MAP;
      default:
        throw TileServerTypeException('Unknown TileServerType number');
    }
  }
}