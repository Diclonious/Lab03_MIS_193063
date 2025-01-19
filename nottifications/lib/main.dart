import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Add a unique name to Firebase initialization
  await Firebase.initializeApp(
    name: 'jokes_app',  // Add this unique name
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await NotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NotificationService.navigatorKey,
      title: 'Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        // Remove the '/' route since we're using home
        // '/': (context) => HomeScreen(),  // Remove this line
        // Add other routes based on your existing screens
        // '/random': (context) => RandomJokeScreen(joke: null),  // Modify as needed
        // '/joke_list': (context) => JokeListScreen(),  // If you have this screen
      },
    );
  }
}
