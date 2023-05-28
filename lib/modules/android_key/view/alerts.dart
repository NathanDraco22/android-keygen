import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/logic/view_model.dart';
import 'package:keytool_app/modules/android_key/view/widgets.dart';


class GeneratorAlert extends StatelessWidget{
  const GeneratorAlert({super.key, required this.paramsModel});

  final ParamsModel paramsModel;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isButtonActive = ValueNotifier(false);
    String fileName = "key";
    String extension = ".jks";
    return  AlertDialog(
      title: const Text("Gerenate Key"),
      contentPadding: const EdgeInsets.all(12),
      content: SizedBox(
        width: 250,
        height: 350,
        child: Column(
          children: [
          Flexible(flex: 1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextKeyFormField(
                  labelText: "Key_FileName",
                  noSpace: true,
                  onChanged: (value) {
                    fileName = value;
                    if(value.isEmpty){
                      isButtonActive.value = false;
                      return;
                    }
                    if(isButtonActive.value) return;
                    isButtonActive.value = true;
                  },
                ),
                FileExtensionSelector(
                  onSelected: (p0) {
                    extension = p0 ?? extension;
                  }
                )
              ],
            )),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Summary"),
                  const SizedBox(height: 10,),
                  _SummaryTable(paramsModel: paramsModel),
                  const SizedBox(height: 50,),

                  ValueListenableBuilder<bool>(
                    valueListenable:  isButtonActive,
                    builder: (BuildContext context, bool isActive, Widget? child) {
                      return FilledButton(
                        onPressed: !isActive 
                        ? null
                        : () {
                           Navigator.pop(context, "$fileName$extension" );
                        }, 
                        child: const Text("Create")
                      );
                    },
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );   
  }
}

class _SummaryTable extends StatelessWidget {
  const _SummaryTable({
    required this.paramsModel,
  });

  final ParamsModel paramsModel;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        bottom: BorderSide(width: 2, color: Colors.white10),
        horizontalInside: BorderSide(width: 2, color: Colors.white10)
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.white10
          ),
          children: [
            const Text("Key_Pass"),
            Text(paramsModel.keyPass)
          ]
        ),
        TableRow(
          children: [
            const Text("Store_Pass"),
            Text(paramsModel.storePass)
          ]
        ),
        TableRow(
           decoration: const BoxDecoration(
            color: Colors.white10
          ),
          children: [
            const Text("Alias"),
            Text(paramsModel.alias)
          ]
        ),
        TableRow(
          children: [
            const Text("RSA"),
            Text(paramsModel.rsa)
          ]
        ),
        TableRow(
           decoration: const BoxDecoration(
            color: Colors.white10
          ),
          children: [
            const Text("Valid"),
            Text(paramsModel.valid)
          ]
        ),
      ],
    );
  }
}


