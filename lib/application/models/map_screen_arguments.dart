// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_photo_and_map/application/models/place_location.dart';

class MapScreenArguments {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  
  MapScreenArguments({
    required this.initialLocation,
    required this.isSelecting,
  });

  MapScreenArguments copyWith({
    PlaceLocation? initialLocation,
    bool? isSelecting,
  }) {
    return MapScreenArguments(
      initialLocation: initialLocation ?? this.initialLocation,
      isSelecting: isSelecting ?? this.isSelecting,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'initialLocation': initialLocation.toMap(),
      'isSelecting': isSelecting,
    };
  }

  factory MapScreenArguments.fromMap(Map<String, dynamic> map) {
    return MapScreenArguments(
      initialLocation: PlaceLocation.fromMap(map['initialLocation'] as Map<String,dynamic>),
      isSelecting: map['isSelecting'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MapScreenArguments.fromJson(String source) => MapScreenArguments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MapScreenArguments(initialLocation: $initialLocation, isSelecting: $isSelecting)';

  @override
  bool operator ==(covariant MapScreenArguments other) {
    if (identical(this, other)) return true;
  
    return 
      other.initialLocation == initialLocation &&
      other.isSelecting == isSelecting;
  }

  @override
  int get hashCode => initialLocation.hashCode ^ isSelecting.hashCode;
}
