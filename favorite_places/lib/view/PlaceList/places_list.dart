import 'package:favorite_places/model/places_model.dart';
import 'package:flutter/material.dart';
import '../PlaceDetails/place_details_screen.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placesList});

  final List<PlacesModel> placesList;

  @override
  Widget build(BuildContext context) {
    if (placesList.isEmpty) {
      return Center(
        child: Text('No places to show', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
      );
    } else {
      return ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (ctxt, index) => ListTile(
          leading: CircleAvatar(radius: 25,
          backgroundImage: FileImage(placesList[index].imageFile),
          ),
          title: Text(placesList[index].placeName),
          subtitle: Text(placesList[index].location.address),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctxt) =>
                    PlaceDetailsScreen(placeSelected: placesList[index]),
              ),
            );
          },
        ),
      );
    }
  }
}
