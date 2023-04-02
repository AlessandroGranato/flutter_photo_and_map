import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_photo_and_map/application/add_place/screens/add_place_screen.dart';
import 'package:flutter_photo_and_map/application/map/screens/map_screen.dart';
import 'package:flutter_photo_and_map/application/models/map_screen_arguments.dart';
import 'package:flutter_photo_and_map/application/place_detail/screens/place_detail_screen.dart';
import 'package:flutter_photo_and_map/application/places_list/screens/places_list_screen.dart';
import 'package:flutter_photo_and_map/application/providers/places.dart';
import 'package:flutter_photo_and_map/application/utils/environments.dart';
import 'package:flutter_photo_and_map/application/utils/not_found_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: Environments.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData();

    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'Photo and map features',
        theme: themeData.copyWith(
          colorScheme: themeData.colorScheme.copyWith(secondary: Colors.amber),
        ),
        home: const PlacesListScreen(),
        routes: {
          PlaceDetailScreen.ROUTE_NAME: (ctx) => const PlaceDetailScreen(),
          AddPlaceScreen.ROUTE_NAME: (ctx) => const AddPlaceScreen(),
        },
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    if (settings.name == MapScreen.ROUTE_NAME && args is MapScreenArguments) {
      return MaterialPageRoute(
        builder: (context) => MapScreen(
            initialLocation: args.initialLocation,
            isSelecting: args.isSelecting),
      );
    }

    // If the route is not found, return a default MaterialPageRoute
    return MaterialPageRoute(builder: (context) => const NotFoundScreen());
  }
}
