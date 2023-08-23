import 'package:breeds_challange/breeds_favorites/controller.dart';
import 'package:breeds_challange/data/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final favoriteBreeds = <String>[].obs;
  final availableBreeds = <String>[].obs;
  final availableSubBreeds = <String, List<String>>{}.obs; // Change to a map
  final selectedBreed = ''.obs;
  final isLoading = false.obs;
  final dataApi = Get.find<DataApi>();
  final favoriteBreedsImages = <String>[].obs;
  final menuIndex = 0.obs;
  @override
  void onInit() async {
    Get.lazyPut(() => BreedsFavController());
    dataApi.listAllBreeds();
    fetchBreeds();
    super.onInit();
  }

  void fetchBreeds() {
    availableBreeds.value = dataApi.availableBreeds;
    availableSubBreeds.value = dataApi.availableSubBreeds;
  }

  void changeMenuInex(index) {
    menuIndex.value = index;

    if (index == 1) {
      Get.toNamed('/favorite_breeds');

      Get.find<BreedsFavController>().changeMenuInex(index);
    } else if (index == 0) {
      Get.toNamed('/');
    }
  }

  fetchImagesFavorites(breed) async {
    if (!favoriteBreeds.contains(breed)) {
      favoriteBreeds.add(breed);
    } else {
      favoriteBreeds.remove(breed);
    }
    print(favoriteBreeds);
  }

  void selectBreed(breed) async {
    isLoading.value = true;
    selectedBreed.value = breed;
    await dataApi.listBreedImage(breed);
    isLoading.value = false;
    Get.toNamed('/breed_images');
    print(selectedBreed);
  }

  void addFavoriteBreed(String breed) {
    favoriteBreeds.add(breed);
  }
}
