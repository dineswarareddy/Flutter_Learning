import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_item_meta_data.dart';

class MealsListCardView extends StatelessWidget {
  const MealsListCardView({
    required this.mealSelected, 
    required this.mealToDiplay, 
    super.key});
  final Meal mealToDiplay;
  final Function() mealSelected;

  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word; // Return empty string if input is empty
    }
    return word[0].toUpperCase() + word.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: mealSelected,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        margin: EdgeInsets.all(16),
        child: Stack(
          children: [
            Hero(
              tag: mealToDiplay.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(mealToDiplay.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity),
            ),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                    color: Colors.black54,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mealToDiplay.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            MealItemMetaData(
                                icon: Icons.schedule,
                                info:
                                    '${mealToDiplay.duration.toString()} min'),
                            MealItemMetaData(
                                icon: Icons.work,
                                info: capitalizeFirstLetter(mealToDiplay.complexity.name)),
                            MealItemMetaData(
                                icon: Icons.attach_money,
                                info: mealToDiplay.affordability.name),
                          ],
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
