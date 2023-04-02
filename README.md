# flutter_photo_and_map

The goal of the project is to learn how to use the following device features from flutter:
* camera
* maps
* internal storage

## Prerequisites to use the app
* You need to have Flutter installed and a IDE to run the app
* You need an emulator (Android studio device managere provides them) or your device connected to flutter to run the app
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

## Screens

TODO

## Screens description
TODO