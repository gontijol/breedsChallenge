import 'dart:convert';

import 'package:breeds_challange/home/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataApi extends GetxController {
  final apiUrl = 'https://dog.ceo';

  final availableBreeds = <String>[].obs;
  final availableSubBreeds = <String, List<String>>{}.obs; // Change to a map
  final favoriteImages = <String>[].obs;
  final availableImages = <String>[].obs;
  final breedImageSelected = 'boxer'.obs;
  final hasImage = <bool>[].obs;

  @override
  onInit() {
    listAllBreeds();
    super.onInit();
  }

  listAllBreeds() async {
    final response = await http.get(Uri.parse('$apiUrl/api/breeds/list/all'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      final breedsResponse = BreedsResponse.fromJson(jsonMap);
      availableBreeds.value = breedsResponse.message.keys.toList();

      breedsResponse.message.forEach((breed, subBreeds) {
        availableBreeds.add(breed);
        if (subBreeds.isNotEmpty) {
          availableSubBreeds[breed] = List<String>.from(subBreeds);
        }
      });
    } else {
      print('Failed to fetch breed list: ${response.statusCode}');
    }
  }

  listBreedImage(breedSelected) async {
    final response =
        await http.get(Uri.parse('$apiUrl/api/breed/$breedSelected/images'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);
      final imagesResponse = ImagesResponse.fromJson(jsonMap);
      availableImages.value = imagesResponse.message;
      if (availableImages.isNotEmpty) {
        hasImage.add(true);
      }
      print(availableImages);
    } else {
      hasImage.add(false);
      print('Failed to fetch breed list: ${response.statusCode}');
    }
  }
}
