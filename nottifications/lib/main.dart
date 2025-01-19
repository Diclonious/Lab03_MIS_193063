import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home.dart';
import 'services/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize timezone
  tz.initializeTimeZones();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
    
    // Initialize notification service
    await NotificationService.initialize();
    
    // Get FCM token for debugging
    String? token = await NotificationService.getToken();
    print('FCM Token: $token');
    
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}
