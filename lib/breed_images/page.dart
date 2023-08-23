import 'package:breeds_challange/core/colors.dart';
import 'package:breeds_challange/data/api.dart';
import 'package:breeds_challange/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreedImages extends GetView {
  const BreedImages({super.key});

  @override
  Widget build(BuildContext context) {
    final favorite = Get.find<HomeController>().selectedBreed.value;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '$favorite Images',
            style: const TextStyle(
              color: lightBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: lightBlue,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightBlue.withOpacity(0.4),
                  lightGrey.withOpacity(0.6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                image: const NetworkImage(
                    'https://images.pexels.com/photos/2607544/pexels-photo-2607544.jpeg?cs=srgb&dl=pexels-simona-kidri%C4%8D-2607544.jpg&fm=jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.15),
                  BlendMode.dstATop,
                ),
              )),
          child: Column(
            children: [
              Expanded(
                child: GetBuilder<DataApi>(
                  builder: (controller) {
                    return GridView.builder(
                      itemCount: controller.availableImages.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: Image.network(
                            controller.availableImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
