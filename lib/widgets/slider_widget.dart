import 'package:flutter/material.dart';
import 'package:shopping_app/app_utils/utilities.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 280,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Image.asset(
                'assets/cover/${coverImages[index]}',
                fit: BoxFit.fill,
              );
            },
            itemCount: coverImages.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
        ),
        Positioned(
          child: buildPageIndicator(),
          bottom: 10,
          right: 0,
          left: 0,
        )
      ],
    );
  }

  Widget buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(coverImages.length, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? colorWhite : colorBlack,
          ),
        );
      }),
    );
  }
}
