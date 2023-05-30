import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keytool_app/modules/android_key/view/android_keygen_screen.dart';
import 'package:keytool_app/modules/tutorial/view/totorial_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("HomeScreen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage("assets/images/android-watch.gif"),
                      height: 150,
                    ),
                  ),
                  Text("Android KeyStore Generator", style: Theme.of(context).textTheme.headlineLarge,)
                ],
              ),
            ),

            Flexible(
              child: Column(
                children: [
                  FilledButton.icon(
                    key: const Key("generatorButton"),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const AndroidKeygenScreen(),
                    )), 
                    icon: const Icon(Icons.key), 
                    label: const Text("Generator")
                  ),
                  const SizedBox(height: 30,),
                  FilledButton.icon(
                    key: const Key("tutorialButton"),
                    onPressed: () => Navigator.push(context, _SidePageRoute(const TutorialScreen())), 
                    icon: const Icon(Icons.book), 
                    label: const Text("Tutorial")
                  ),
                  const SizedBox(height: 30,),
                  FilledButton.icon(
                    key: const Key("githubButton"),
                    onPressed: () {
                      final Uri uri = Uri.parse("https://github.com/NathanDraco22/android-keygen");
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    },
                    icon: const Icon(FontAwesomeIcons.github), 
                    label: const Text("Github")
                  ),
                ],
              ),
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