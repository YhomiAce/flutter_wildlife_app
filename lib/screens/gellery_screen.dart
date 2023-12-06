import 'package:flutter/material.dart';
import '../../app_utils/utilities.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Map<String, dynamic>> animalList = [];
  String selectedAnimal = "assets/Hero/anaconda.jpg";
  int gridColumn = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData('assets/data/animals.json').then((data) {
      if (data != null) {
        animalList = data;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack.withOpacity(0.7),
      appBar: AppBar(
        foregroundColor: colorWhite,
        backgroundColor: colorBlack.withOpacity(0.7),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipOval(
              child: Image.asset(
                selectedAnimal,
                fit: BoxFit.cover,
                width: 280,
                height: 280,
              ),
            ),
            Slider(
                min: 1,
                max: 3,
                divisions: 2,
                activeColor: colorLightGreen,
                value: gridColumn.toDouble(),
                onChanged: (value) {
                  setState(() {
                    gridColumn = value.toInt();
                  });
                }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  itemCount: animalList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridColumn,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) => Image.asset(
                    'assets/Hero/${animalList[index]['image']}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
