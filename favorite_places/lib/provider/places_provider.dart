import 'package:favorite_places/model/places_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class PlacesNotifier extends StateNotifier<List<PlacesModel>> {
  PlacesNotifier() : super([]);

  addPlaceToList({required PlacesModel place}) async {
    final dirPath = await syspath.getApplicationDocumentsDirectory();
    final name = path.basename(place.imageFile.path);
    final copiedImage = await place.imageFile.copy('${dirPath.path}/$name');
    place.imageFile = copiedImage;
    state = [...state, place];
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<PlacesModel>>((ref) {
  return PlacesNotifier();
});