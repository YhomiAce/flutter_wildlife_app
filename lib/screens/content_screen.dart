import 'package:flutter/material.dart';
import 'package:shopping_app/app_utils/utilities.dart';
import 'package:shopping_app/widgets/grid_view_widget.dart';
import 'package:shopping_app/widgets/list_view_widget.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  List<Map<String, dynamic>> animalList = [];
  bool isGridActive = false;
  int elements = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData('assets/data/animals.json').then((data) {
      if (data != null) {
        setState(() {
          animalList = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack.withOpacity(0.7),
      appBar: AppBar(
        title: const Text('Amazon Species'),
        backgroundColor: colorBlack.withOpacity(0.7),
        foregroundColor: colorWhite,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridActive = false;
              });
            },
            icon: const Icon(
              Icons.view_list,
              size: 26,
              color: colorWhite,
            ),
          ),
          IconButton(
            onPressed: gridSwitch,
            icon: Icon(
              elements == 2 ? Icons.grid_on : Icons.grid_view_outlined,
              color: elements == 2 ? Colors.teal : colorYellowAccent,
            ),
          ),
        ],
      ),
      body: isGridActive
          ? GridViewWidget(elements: elements, animals: animalList)
          : ListViewWidget(animalList: animalList, elements: elements),
    );
  }

  void gridSwitch() {
    setState(() {
      isGridActive = true;
    });
    if (elements == 1) {
      setState(() {
        elements = 2;
      });
    } else if (elements == 2) {
      setState(() {
        elements = 1;
      });
    }
  }
}
