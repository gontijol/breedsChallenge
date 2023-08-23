import 'package:breeds_challange/breeds_favorites/controller.dart';
import 'package:breeds_challange/core/colors.dart';
import 'package:breeds_challange/data/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteBreeds extends GetView<BreedsFavController> {
  const FavoriteBreeds({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Obx(() {
          if (controller.favoriteBreeds.isEmpty) {
            return const Center(
              child: Text('None of the breeds are favorite'),
            );
          } else if (controller.images.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.favoriteBreeds.length,
              itemBuilder: (context, index) {
                final breed = controller.favoriteBreeds[index];
                final breedImages = controller.images[breed];
                final hasImage = Get.find<DataApi>().hasImage[index];
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          hasImage == true
                              ? controller.images[breed]!.first
                              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgK0LKpZ3rKgJoYvP4j_xROS4L5g7fBWJzDLBq5T8&s',
                        ),
                      ),
                      title: Text(
                        breed,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    if (hasImage == true && breedImages!.length >= 5)
                      SizedBox(
                        height: Get.height * 0.3,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              breedImages.length > 5 ? 5 : breedImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                breedImages[index],
                                width: Get.height * 0.3,
                              ),
                            );
                          },
                        ),
                      ),
                    if (hasImage == false)
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Dog has no image'),
                      ),
                    const Divider(),
                  ],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
