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
              onPressed: () => Navigator.push(context, _SidePageRoute(const TutorialScreen())), 
              icon: const Icon(Icons.book), 
              label: const Text("Tutorial")
            ),
          ],
        ),
      ),
    );
  }
}


class _SidePageRoute extends PageRoute {

  final Widget child;

  _SidePageRoute(this.child);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 1), 
        end: const Offset(0,0)
      ).animate(animation),
      child: child,
    );
  }

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

}