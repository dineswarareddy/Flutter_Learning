import 'package:favorite_places/model/places_model.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:favorite_places/view/AddPlace/add_place_screen.dart';
import 'package:favorite_places/view/PlaceDetails/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'places_list.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(placesList: placesList),
      )
    );
  }
}
