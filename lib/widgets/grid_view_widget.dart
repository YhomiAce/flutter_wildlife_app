import 'package:flutter/material.dart';
import 'package:shopping_app/screens/animal_details_screen.dart';

class GridViewWidget extends StatelessWidget {
  final int elements;
  final List<Map<String, dynamic>> animals;
  const GridViewWidget(
      {super.key, required this.elements, required this.animals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: elements,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AnimalDetailScreen(animal: animals[index]),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/Hero/${animals[index]['image']}.jpg",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      itemCount: animals.length,
    );
  }
}
