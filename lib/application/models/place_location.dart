// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  PlaceLocation copyWith({
    double? latitude,
    double? longitude,
    String? address,
  }) {
    return PlaceLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  factory PlaceLocation.fromMap(Map<String, dynamic> map) {
    return PlaceLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceLocation.fromJson(String source) =>
      PlaceLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PlaceLocation(latitude: $latitude, longitude: $longitude, address: $address)';

  @override
  bool operator ==(covariant PlaceLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.address == address;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ address.hashCode;
}
