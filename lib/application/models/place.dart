// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';
import 'place_location.dart';

class Place {
  final String id;
  final String name;
  final File photo;
  final PlaceLocation location;

  Place({
    required this.id,
    required this.name,
    required this.photo,
    required this.location,
  });

  Place copyWith({
    String? id,
    String? name,
    File? photo,
    PlaceLocation? location,
  }) {
    return Place(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo.path,
      'location': location.toMap(),
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'] as String,
      name: map['name'] as String,
      photo: File(map['photo'] as String),
      location: PlaceLocation.fromMap(map['location'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toDBMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo_path': photo.path,
      'location_lat': location.latitude,
      'location_lng': location.longitude,
      'location_address': location.address
    };
  }

  factory Place.fromDBMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'] as String,
      name: map['name'] as String,
      photo: File(map['photo_path'] as String),
      location: PlaceLocation(
        latitude: map['location_lat'],
        longitude: map['location_lng'],
        address: map['location_address'],
      ),
    );
  }

  @override
  String toString() {
    return 'Place(id: $id, name: $name, photo: $photo, location: $location)';
  }

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.photo == photo &&
        other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ photo.hashCode ^ location.hashCode;
  }
}
