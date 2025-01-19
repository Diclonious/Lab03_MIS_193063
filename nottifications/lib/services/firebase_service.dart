import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/joke.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save joke to favorites
  static Future<void> saveFavoriteJoke(Joke joke) async {
    try {
      print('Attempting to save joke: ${joke.id}');
      await _firestore.collection('col1').doc(joke.id.toString()).set({
        'id': joke.id,
        'type': joke.type,
        'setup': joke.setup,
        'punchline': joke.punchline,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Joke saved successfully');
    } catch (e) {
      print('Error saving joke: $e');
      throw e;
    }
  }

  // Get favorite jokes
  static Stream<List<Joke>> getFavoriteJokes() {
    print('Fetching favorite jokes');
    return _firestore
        .collection('col1')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      print('Found ${snapshot.docs.length} favorite jokes');
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Joke(
          id: data['id'],
          type: data['type'],
          setup: data['setup'],
          punchline: data['punchline'],
        );
      }).toList();
    });
  }
} 