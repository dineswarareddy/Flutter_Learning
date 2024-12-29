import 'package:favorite_places/model/location_model.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';


class PlacesModel {
  String id;
  String placeName;
  File imageFile;
  LocationModel location;


  PlacesModel({required this.placeName, required this.imageFile, required this.location}) : id = Uuid().v4() ;
}
