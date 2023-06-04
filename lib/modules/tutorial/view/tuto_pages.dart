part of 'totorial_screen.dart';

 final pages =  [

        TutoPage(
          imagePath: "assets/images/tuto/step1.png",
          description:  RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Set the java sdk bin folder path, commonly it is \n" ,
              children: [
                TextSpan(
                  text: r"C:\Program Files\java\version\bin",
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: " in windows \n",
                ),
                TextSpan(
                  text: "An set the Output folder.",
                )
              ]
            ),
          ),
          footerDescription: const Text("Important: Run as Administrator") ,
        ),

        TutoPage(
          imagePath: "assets/images/tuto/step2.png", 
          description: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Fill the form with your data \n",
              children: [
                TextSpan(
                  text: "Country-Code: US, UK, AU, MX",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )
          )
        ),

        TutoPage(
          imagePath: "assets/images/tuto/step3.png", 
          description: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Fill the form with your data \n",
              children: [
                TextSpan(
                  text: "Country-Code Example: US, UK, AU, MX...",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )
          )
        ),

        TutoPage(
          imagePath: "assets/images/tuto/step4.png", 
          description: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Create an Alias for your Key\n and press in generate button \n",
              children: [
                TextSpan(
                  text: "Recommended: RSA = 2048 and Valid = 10000",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )
          )
        ),

        TutoPage(
          imagePath: "assets/images/tuto/step5.png", 
          description: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Set a name to your key file \n and then press in create button \n",
              children: [
                TextSpan(
                  text: "Summary display an important data you must remember",
                  style: TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            )
          )
        ),

        TutoPage(
          imagePath: "assets/images/tuto/step6.png", 
          description: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "Use the file .jks/.keystore without the 'old' \n old format is just a backup",
            )
          )
        ),
      ];