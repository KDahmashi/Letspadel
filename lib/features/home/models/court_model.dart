import 'package:json_annotation/json_annotation.dart';

part 'court_model.g.dart';

@JsonSerializable()
class CourtModel {
  @JsonKey(name: 'court_id')
  final String courtId;
  final String name;
  final String description;
  @JsonKey(name: 'surface_type')
  final String surfaceType;
  final bool indoor;
  final bool lighting;
  final String image;
  final Location location;
  final Contact contact;

  CourtModel({
    required this.courtId,
    required this.name,
    required this.description,
    required this.surfaceType,
    required this.indoor,
    required this.lighting,
    required this.image,
    required this.location,
    required this.contact,
  });

  factory CourtModel.fromJson(Map<String, dynamic> json) => _$CourtModelFromJson(json);

  Map<String, dynamic> toJson() => _$CourtModelToJson(this);
}

@JsonSerializable()
class Location {
  final String address;
  final String city;
  final String state;
  final String country;
  @JsonKey(name: 'postal_code')
  final String postalCode;

  Location({
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Contact {
  final String phone;
  final String email;
  final String website;

  Contact({
    required this.phone,
    required this.email,
    required this.website,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}