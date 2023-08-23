import 'package:breeds_challange/breeds_favorites/controller.dart';
import 'package:breeds_challange/core/colors.dart';
import 'package:breeds_challange/data/api.dart';
import 'package:breeds_challange/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DataApi());

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetBuilder<DataApi>(
          builder: (index) {
            return Obx(() => BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.pets),
                      label: 'Favorites',
                    ),
                  ],
                  currentIndex: controller.menuIndex.value,
                  selectedItemColor: lightBlue,
                  onTap: (int index) {
                    if (index == 0) {
                      controller.changeMenuInex(index);
                      print('Home');
                    } else if (index == 1) {
                      Get.find<BreedsFavController>().fetchImages();
                      controller.changeMenuInex(index);

                      print('Favorites');
                    }
                  },
                ));
          },
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
          child: Obx(
            () => ListView.builder(
              itemCount: controller.availableBreeds.length,
              itemBuilder: (context, index) {
                final breed = controller.availableBreeds[index];
                final subBreeds = controller.availableSubBreeds[breed];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Breed:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title: GestureDetector(
                        child: Text(breed),
                        onTap: () => controller.selectBreed(breed),
                      ),
                      trailing: Obx(() => IconButton(
                            icon: Icon(
                              Icons.pets,
                              color: controller.favoriteBreeds.contains(breed)
                                  ? lightBlue
                                  : black.withOpacity(0.5),
                            ),
                            onPressed: () {
                              controller.fetchImagesFavorites(breed);
                            },
                          )),
                    ),
                    if (subBreeds != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: subBreeds
                            .map((subBreed) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: ListTile(
                                    title: Text(subBreed),
                                    trailing: Obx(() => IconButton(
                                          icon: Icon(
                                            Icons.pets,
                                            color: controller.favoriteBreeds
                                                    .contains(subBreed)
                                                ? lightBlue
                                                : black.withOpacity(0.5),
                                          ),
                                          onPressed: () {
                                            controller
                                                .fetchImagesFavorites(subBreed);
                                          },
                                        )),
                                  ),
                                ))
                            .toList(),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
