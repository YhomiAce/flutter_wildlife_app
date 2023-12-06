import 'package:flutter/material.dart';
import '../../app_utils/utilities.dart';
import '../../screens/animal_details_screen.dart';
import '../../widgets/slider_widget.dart';

class ListViewWidget extends StatelessWidget {
  final int elements;
  final List<Map<String, dynamic>> animalList;
  const ListViewWidget(
      {super.key, required this.animalList, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider for images
        const SliderWidget(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: animalList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimalDetailScreen(
                              animal: animalList[index],
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/Hero/${animalList[index]['image']}.jpg',
                          height: 90,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            animalList[index]['name'],
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: colorLightGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            animalList[index]['headline'],
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: colorWhite,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
