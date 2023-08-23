import 'package:breeds_challange/breeds_favorites/controller.dart';
import 'package:get/get.dart';

class FavoriteBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BreedsFavController());
  }
}
