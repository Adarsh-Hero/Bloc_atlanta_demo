import 'geo_point.dart';

class Address {
  GeoPoint geo;
  String street;
  String suite;
  String city;
  String zipCode;

  Address({this.geo, this.city, this.street, this.suite, this.zipCode});

  factory Address.fromMap(map) {
    return Address(
        geo: GeoPoint.fromMap(map['geo']),
        street: map['street'] ?? '',
        suite: map['suite'] ?? '',
        city: map['city'] ?? '',
        zipCode: map['zipcode'] ?? '');
  }
}
