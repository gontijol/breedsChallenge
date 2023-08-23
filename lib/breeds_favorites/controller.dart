import 'package:breeds_challange/data/api.dart';
import 'package:breeds_challange/home/controller.dart';
import 'package:get/get.dart';

class BreedsFavController extends GetxController {
  final dataApi = Get.find<DataApi>();
  final breedsController = Get.find<HomeController>();
  final favoriteBreeds = <String>[].obs;
  final menuIndex = 1.obs;
  final images = <String, List<String>>{}.obs;
  final hasImage = <bool>[].obs;

  @override
  onInit() async {
    await fetchFavorites();
    super.onInit();
  }

  void changeMenuInex(index) {
    menuIndex.value = index;

    if (index == 1) {
      Get.toNamed('/favorite_breeds');
    } else if (index == 0) {
      Get.find<HomeController>().changeMenuInex(index);
      Get.toNamed('/');
    }
  }

  fetchFavorites() {
    favoriteBreeds.value = breedsController.favoriteBreeds;
    print(favoriteBreeds);
  }

  fetchImages() async {
    for (var breed in favoriteBreeds) {
      await dataApi.listBreedImage(breed);
      images[breed] = List<String>.from(dataApi.availableImages);
    }
  }
}
