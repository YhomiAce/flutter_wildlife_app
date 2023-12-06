import 'package:flutter/material.dart';
import '../../app_utils/utilities.dart';

class AnimalDetailScreen extends StatefulWidget {
  final Map<String, dynamic> animal;
  const AnimalDetailScreen({super.key, required this.animal});

  @override
  State<AnimalDetailScreen> createState() => _AnimalDetailScreenState();
}

class _AnimalDetailScreenState extends State<AnimalDetailScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: colorWhite.withOpacity(0.3),
        foregroundColor: colorWhite,
        title: Text('Learn about ${widget.animal['name']}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/Hero/${widget.animal['image']}.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.animal['name'].toUpperCase(),
              style: const TextStyle(
                color: colorWhite,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: colorYellowAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.animal['headline'],
                style: const TextStyle(
                  color: colorYellowAccent,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.perm_media_outlined,
                  color: colorYellowAccent,
                  size: 31,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Wildlife in pictures',
                  style: TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                          "assets/gallery/${widget.animal['image']}/${widget.animal['image']}-${index + 1}.jpg"),
                    ),
                  ),
                  itemCount: widget.animal['gallery'].length,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  color: colorYellowAccent,
                  size: 31,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Did you know?',
                  style: TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 168,
                    width: double.infinity,
                    child: PageView.builder(
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: colorBlack.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              widget.animal['fact'][index],
                              style: const TextStyle(
                                color: colorWhite,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      itemCount: widget.animal['fact'].length,
                      onPageChanged: (int page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 10.0,
                    right: 0.0,
                    child: buildPageIndicator(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.description,
                  color: colorYellowAccent,
                  size: 31,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "All about ${widget.animal['name']}",
                  style: const TextStyle(
                    fontSize: 23,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.animal['description'],
                style: const TextStyle(
                  color: colorWhite,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.animal['fact'].length, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentPage == index ? colorWhite : colorGrey.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
