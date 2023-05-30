import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:keytool_app/main.dart";

void main() {

  group("Home Screen ->", () {

    testWidgets("Test Title", (widgetTester) async{
      await widgetTester.binding.setSurfaceSize(const Size(500, 700));
      final findTitleText = find.text("Android KeyStore Generator");
      final findImage = find.image(const AssetImage("assets/images/android-watch.gif"));
      await widgetTester.pumpWidget(const MyApp());
      expect(findTitleText, findsOneWidget);
      expect(findImage, findsOneWidget);
    });

    testWidgets("test Buttons", (widgetTester) async {

      final findGeneratorButton = find.byKey(const ValueKey("generatorButton"));
      final findTutorialButton = find.byKey(const ValueKey("tutorialButton"));
      final findGithubButton = find.byKey(const ValueKey("githubButton"));
  
      await widgetTester.pumpWidget(const MyApp());

      expect(findGeneratorButton, findsOneWidget);
      expect(findTutorialButton, findsOneWidget);
      expect(findGithubButton, findsOneWidget);
    });

    testWidgets("test icons", (widgetTester) async{

      final findKeyIcon = find.byIcon(Icons.key);
      final findTutoIcon = find.byIcon(Icons.book);
      final findGithubIcon = find.byIcon(FontAwesomeIcons.github);

      await widgetTester.pumpWidget(const MyApp());

      expect(findKeyIcon, findsOneWidget);
      expect(findTutoIcon, findsOneWidget);
      expect(findGithubIcon, findsOneWidget);
    });


   });




}


