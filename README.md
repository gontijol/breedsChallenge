Dog Breed App Challenge
This repository contains the solution for the Dog Breed App Challenge for the Shaw and Partners mobile developer role. The challenge involves creating a mobile app that consumes the provided API to list dog breeds and their images. Users can mark breeds as favorites, view breed images, and see their favorite breeds along with images. The app is built using Flutter framework.

Features
Home Screen: Lists all available dog breeds.
Breed Images Screen: Lists all images of a selected breed.
Favorites Screen: Lists user-selected favorite breeds along with their images.
Local Storage: User-selected favorite breeds are stored locally for offline access.
Getting Started
To run this app locally, follow these steps:

Clone this repository:

bash
Copy code
git clone https://github.com/your-username/dog-breed-app.git
Change into the app directory:

bash
Copy code
cd dog-breed-app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
Tests
Unit tests and widget tests have been included to ensure the correctness of the application. To run the tests:

bash
Copy code
flutter test
API Integration
The app consumes the provided API to fetch breed information and images. Two API endpoints are utilized:

GET /api/breeds/list/all - Returns a list of all available dog breeds.
GET /api/breed/{breed name}/images - Returns a list of all available images of a breed.
