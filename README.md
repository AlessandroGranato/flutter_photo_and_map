# flutter_photo_and_map

The goal of the project is to learn how to use the following device features from flutter:
* camera
* maps
* internal storage

## Prerequisites to use the app
* You need to have Flutter installed and an IDE to run the app
* You need an emulator (Android studio device manager provides them) or your device connected to flutter to run the app
* In order to use map features, the app is connected to at least one static map and tile server provider (Google maps, map quest, geoapify, thunderforest), so you need to have an api key for them

## Initial configuration
* In the root folder, you need to create a file called .env_dev (or .env_prod if you are running the project in release mode) and you need to populate it with the following values: <br />
GOOGLE_MAPS_API_KEY = YOUR_GOOGLE_MAPS_API_KEY <br />
GOOGLE_MAPS_SIGNATURE = YOUR_GOOGLE_MAPS_SIGNATURE <br />
MAP_QUEST_API_KEY = YOUR_MAP_QUEST_API_KEY <br />
GEOAPIFY_API_KEY = YOUR_GEOAPIFY_API_KEY <br />
THUNDERFOREST_API_KEY = YOUR_THUNDERFOREST_API_KEY <br />
STATIC_MAP_SERVER_TYPE = Enum of the chosen static map server provider (values are explained below) <br />
TILE_SERVER_TYPE = Enum of the chosen server tile provider (values are explained below) <br />
USER_AGENT_PACKAGE_NAME = YOUR_PACKAGE_NAME <br />
    
* For STATIC_MAP_SERVER_TYPE, you can select one of the following integer values: 0, 1, 2
    * Choose 0 if you want to use GEOAPIFY
    * Choose 1 if you want to use GOOGLE MAPS
    * Choose 2 if you want to use MAP QUEST

* For TILE_SERVER_TYPE, you can select one of the following integer values: 0, 1, 2
    * Choose 0 if you want to use GEOAPIFY
    * Choose 1 if you want to use THUNDERFOREST
    * Choose 2 if you want to use OPEN_STREET_MAP

* For USER_AGENT_PACKAGE_NAME, put a string for your package name like com.myexample

## Run the app
From your ide (ex VSCode) run the app on the emulator or on your device

## Screens

<img title= "Places List Screen" src="https://user-images.githubusercontent.com/18091071/229346212-bdec2d40-7d77-4064-8169-bb69f5f3818d.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346212-bdec2d40-7d77-4064-8169-bb69f5f3818d.jpg" width="300" height="650" />
<img title= "Add New Place Screen" src="https://user-images.githubusercontent.com/18091071/229346216-8592b26f-7fcb-4dd3-82aa-eff2a79fc34b.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346216-8592b26f-7fcb-4dd3-82aa-eff2a79fc34b.jpg" width="300" height="650" />
<img title= "Make a Photo" src="https://user-images.githubusercontent.com/18091071/229346217-d4bc301b-27bc-4364-89c9-28712b8d8d39.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346217-d4bc301b-27bc-4364-89c9-28712b8d8d39.jpg" width="300" height="650" />

<img title= "Add New Place Screen with photo taken" src="https://user-images.githubusercontent.com/18091071/229346220-3cb3541d-e068-44a7-8e58-d5fb20ebadc2.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346220-3cb3541d-e068-44a7-8e58-d5fb20ebadc2.jpg" width="300" height="650" />
<img title= "Map screen" src="https://user-images.githubusercontent.com/18091071/229346222-4aaae0d2-1c27-4501-bae8-700c1b7d48a7.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346222-4aaae0d2-1c27-4501-bae8-700c1b7d48a7.jpg" width="300" height="650" />
<img title= "Add New Place Screen with photo and map taken" src="https://user-images.githubusercontent.com/18091071/229346224-b4d973c7-494a-4737-a7de-d87c965cdeaa.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346224-b4d973c7-494a-4737-a7de-d87c965cdeaa.jpg" width="300" height="650" />

<img title= "Places List Screen updated" src="https://user-images.githubusercontent.com/18091071/229346226-1c792e21-6c9c-48c5-91f6-b35489f29a5b.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346226-1c792e21-6c9c-48c5-91f6-b35489f29a5b.jpg" width="300" height="650" />
<img title= "Place detail" src="https://user-images.githubusercontent.com/18091071/229346227-50b78e42-dacb-4aa7-abb2-9e24c977ff82.jpg" data-canonical-src="https://user-images.githubusercontent.com/18091071/229346227-50b78e42-dacb-4aa7-abb2-9e24c977ff82.jpg" width="300" height="650" />

## Screens description
1. Places List Screen: Main screen when you open the app. It contains all your saved place. You can click on + (up right) to add a new place.
2. Add New Place Screen: main screen when you want to add a new place. It allows you to define your place information by defining a title, making a photo and select the location of the new place. For selecting the location, you can either click on "Use current location" if you want the device to automatically use the position where you are at, or you can select it on map.
3. Make a Photo: Screen that allows you to take a photo of the place and save it.
4. Add New Place Screen with photo taken: this is the screen seen in point 2, updated with the title and the photo.
5. Map screen: This is the screen that you see if in point 4 you click on "Select on map" button. Here you can navigate the map and put a place marker (in red) at the place location you want to save.
6. Add New Place Screen with photo and map taken: this is the screen seen in point 2, updated with the title, the phot and the map location taken. From here, you can click on " + Add place " button to save the new place.
7. Places List Screen updated: this is the screen seen in point 2, updated with the new saved place.
8. Place detail: this is the screen that you land on if you click on an item on the screen reported in point 1. Here you can find all the saved information of the place, and if you click on "view on map", you will see the place in the map (like screen reported in point 4, but the difference here is that the marker can be placed, since it is saved for that particular place location).

Enjoy saving your places and see them whenever you want! 👍