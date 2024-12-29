import 'package:favorite_places/model/places_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetailsScreen extends ConsumerWidget {
const PlaceDetailsScreen({required this.placeSelected, super.key});

final PlacesModel placeSelected;
  final String _googlePlacesKey = 'AIzaSyDHsI2Gp5k3p3Q4DzU-kWxSuZmGqS2We8c';

  String get locationImage {
    final lat = placeSelected.location.latitude;
    final long = placeSelected.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center$lat,$long=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$long&key=$_googlePlacesKey';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(placeSelected.placeName)),
      body: Stack(
        children: [
          Image.file(placeSelected.imageFile,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(locationImage),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.transparent,Colors.black54],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                  ),
                ),
                child: 
                Text(
                  placeSelected.location.address, 
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
              )
              ]
            )
          )
        ],
      ),
    );
  }
}