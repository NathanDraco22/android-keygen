import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/view/android_keygen_screen.dart';
import 'package:keytool_app/modules/tutorial/view/totorial_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => const AndroidKeygenScreen(),
              )), 
              icon: const Icon(Icons.key), 
              label: const Text("Generator")
            ),
            const SizedBox(height: 30,),
            FilledButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => const TutorialScreen(),
              )), 
              icon: const Icon(Icons.book), 
              label: const Text("Tutorial")
            ),


          ],
        ),
      ),
    );
  }
}