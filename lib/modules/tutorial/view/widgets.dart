import 'package:flutter/material.dart';


class TutoPage extends StatelessWidget {
  const TutoPage({
    super.key, required this.imagePath, required this.description, this.footerDescription,
  });

  final String imagePath;
  final Widget description;
  final Widget? footerDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image(
            image: AssetImage(imagePath),
            height: 400, 
          ),
          description,
          const SizedBox(height: 40,),
          if(footerDescription != null) footerDescription!
        ],
      ),
    );
  }
}
