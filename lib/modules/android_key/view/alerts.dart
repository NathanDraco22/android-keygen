import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/view/widgets.dart';




class GeneratorAlert extends StatelessWidget{
  const GeneratorAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text("Gerenate Key"),
      contentPadding: EdgeInsets.all(12),
      content: SizedBox(
        width: 250,
        height: 350,
        child: Column(
          children: [
            Flexible(flex: 4,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextKeyFormField(
                  labelText: "Key_FileName",
                  noSpace: true,
                ),
                FileExtensionSelector()

              ],
            )),
            Flexible(flex: 5,child: Container()),
          ],
        ),
      ),
    );   
  }
}


