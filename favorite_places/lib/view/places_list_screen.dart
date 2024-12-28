import 'package:favorite_places/model/places_model.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/view/add_place_screen.dart';
import 'package:favorite_places/view/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PlacesModel> placesList = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctxt) => AddNewPlace()),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (ctxt, index) => ListTile(
          title: Text(placesList[index].placeName),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctxt) =>
                    PlaceDetailsScreen(placeSelected: placesList[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
