class DogBreed {
  final String name;
  final List<String> subBreeds;

  DogBreed({required this.name, required this.subBreeds});

  factory DogBreed.fromJson(String name, List<dynamic> json) {
    return DogBreed(
      name: name,
      subBreeds: List<String>.from(json),
    );
  }
}

class BreedsResponse {
  final Map<String, List<String>> message;
  final String status;

  BreedsResponse({required this.message, required this.status});

  factory BreedsResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> messageJson = json['message'];
    final Map<String, List<String>> messageData = {};

    messageJson.forEach((breed, subBreeds) {
      if (subBreeds is List) {
        messageData[breed] = List<String>.from(subBreeds);
      } else {
        messageData[breed] = [];
      }
    });

    return BreedsResponse(
      message: messageData,
      status: json['status'],
    );
  }
}

class ImagesResponse {
  final List<String> message;
  final String status;

  ImagesResponse({required this.message, required this.status});

  factory ImagesResponse.fromJson(Map<String, dynamic> json) {
    return ImagesResponse(
      message: List<String>.from(json['message']),
      status: json['status'],
    );
  }
}
