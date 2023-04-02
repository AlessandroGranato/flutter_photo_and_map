import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// https://developer.school/tutorials/how-to-use-environment-variables-with-flutter-dotenv
class Environments {
  static String get fileName => kReleaseMode ? ".env_prod" : ".env_dev";
  static String get test => dotenv.env['TEST'] ?? 'test-default';
  static String get googleMapsApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  static String get googleMapsSignature => dotenv.env['GOOGLE_MAPS_SIGNATURE'] ?? '';
  static String get geoapifyApiKey => dotenv.env['GEOAPIFY_API_KEY'] ?? '';
  static String get mapQuestApiKey => dotenv.env['MAP_QUEST_API_KEY'] ?? '';
  static String get thunderForestApiKey => dotenv.env['THUNDER_FOREST_API_KEY'] ?? '';
  static int get staticMapServerType => int.parse(dotenv.env['STATIC_MAP_SERVER_TYPE'] ?? '0') ;
  static int get tileServerType => int.parse(dotenv.env['TILE_SERVER_TYPE'] ?? '0') ;
  static String get userAgentPackageName => dotenv.env['USER_AGENT_PACKAGE_NAME'] ?? '';
}