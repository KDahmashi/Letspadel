// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourtModel _$CourtModelFromJson(Map<String, dynamic> json) => CourtModel(
      courtId: json['court_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      surfaceType: json['surface_type'] as String,
      indoor: json['indoor'] as bool,
      lighting: json['lighting'] as bool,
      image: json['image'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourtModelToJson(CourtModel instance) =>
    <String, dynamic>{
      'court_id': instance.courtId,
      'name': instance.name,
      'description': instance.description,
      'surface_type': instance.surfaceType,
      'indoor': instance.indoor,
      'lighting': instance.lighting,
      'image': instance.image,
      'location': instance.location,
      'contact': instance.contact,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postal_code'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postal_code': instance.postalCode,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      phone: json['phone'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
    };
