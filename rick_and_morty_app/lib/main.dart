import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/home_screen.dart';

void main() {
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}