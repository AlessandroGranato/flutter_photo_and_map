// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class TileServerInfo {
  final String? apiKey;
  final String source;
  final String urlTemplate;
  final Map<String, String>? additionalOptionsMap;
  TileServerInfo({
    this.apiKey,
    required this.source,
    required this.urlTemplate,
    this.additionalOptionsMap,
  });
  

  TileServerInfo copyWith({
    String? apiKey,
    String? source,
    String? urlTemplate,
    Map<String, String>? additionalOptionsMap,
  }) {
    return TileServerInfo(
      apiKey: apiKey ?? this.apiKey,
      source: source ?? this.source,
      urlTemplate: urlTemplate ?? this.urlTemplate,
      additionalOptionsMap: additionalOptionsMap ?? this.additionalOptionsMap,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiKey': apiKey,
      'source': source,
      'urlTemplate': urlTemplate,
      'additionalOptionsMap': additionalOptionsMap,
    };
  }

  factory TileServerInfo.fromMap(Map<String, dynamic> map) {
    return TileServerInfo(
      apiKey: map['apiKey'] != null ? map['apiKey'] as String : null,
      source: map['source'] as String,
      urlTemplate: map['urlTemplate'] as String,
      additionalOptionsMap: map['additionalOptionsMap'] != null ? Map<String, String>.from(map['additionalOptionsMap'] as Map<String, String>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TileServerInfo.fromJson(String source) => TileServerInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TileServerInfo(apiKey: $apiKey, source: $source, urlTemplate: $urlTemplate, additionalOptionsMap: $additionalOptionsMap)';
  }

  @override
  bool operator ==(covariant TileServerInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.apiKey == apiKey &&
      other.source == source &&
      other.urlTemplate == urlTemplate &&
      mapEquals(other.additionalOptionsMap, additionalOptionsMap);
  }

  @override
  int get hashCode {
    return apiKey.hashCode ^
      source.hashCode ^
      urlTemplate.hashCode ^
      additionalOptionsMap.hashCode;
  }
}
