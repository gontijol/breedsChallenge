import 'package:breeds_challange/breed_images/page.dart';
import 'package:breeds_challange/breeds_favorites/binding.dart';
import 'package:breeds_challange/breeds_favorites/page.dart';
import 'package:breeds_challange/home/binding.dart';
import 'package:breeds_challange/home/page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String breedImagesPage = '/breed_images';
  static const String favoriteBreedsPage = '/favorite_breeds';

  static final pages = [
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: breedImagesPage,
      page: () => const BreedImages(),
      // binding: DialPadBinding(),
    ),
    GetPage(
      name: favoriteBreedsPage,
      page: () => const FavoriteBreeds(),
      binding: FavoriteBindings(),
    ),
  ];
}
