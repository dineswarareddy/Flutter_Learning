import 'package:favorite_places/model/places_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetailsScreen extends ConsumerWidget {
const PlaceDetailsScreen({required this.placeSelected, super.key});

final PlacesModel placeSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(placeSelected.placeName)),
      body: Container(),
    );
  }
}