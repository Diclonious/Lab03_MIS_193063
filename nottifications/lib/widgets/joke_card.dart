import 'package:flutter/material.dart';
import '../models/joke_type.dart';

class JokeCard extends StatelessWidget {
  final JokeType type;
  final VoidCallback onTap;

  const JokeCard({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.emoji_emotions, size: 28),
              SizedBox(width: 16),
              Text(
                type.type.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
