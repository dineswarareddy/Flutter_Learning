import 'package:favorite_places/model/places_model.dart';
import 'package:riverpod/riverpod.dart';

class PlacesNotifier extends StateNotifier<List<PlacesModel>> {
  PlacesNotifier() : super([]);

  addPlaceToList({required PlacesModel place}) {
    state = [...state, place];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<PlacesModel>>((ref) {
  return PlacesNotifier();
});