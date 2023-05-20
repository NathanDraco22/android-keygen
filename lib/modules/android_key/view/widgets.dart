
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class DirPickWidget extends StatelessWidget {
  const DirPickWidget({super.key, required this.textLabel,required this.onDirPicked});

  final String textLabel;
  final void Function(String path) onDirPicked;
  

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Row(
      children: [
        IconButton(
          onPressed: ()async{
            final res = await FilePicker.platform.getDirectoryPath();
            if(res == null) return;
            controller.text = res;
            onDirPicked(res);
          }, 
          icon:const Icon(Icons.folder)),
        const SizedBox(width: 15,),
        Expanded(
          child: SizedBox(
            height: 32,
            child: TextField(
              controller: controller,
              enabled: false,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: textLabel,
                contentPadding: const EdgeInsets.symmetric(horizontal:10),
                filled: true,
                border: OutlineInputBorder(
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade300,width: 1)
                )
              ),
            ),
          )
        ),

      ],
    );
  }

}




class TextKeyFormField extends StatelessWidget {
  const TextKeyFormField({
    super.key,
    this.labelText
  });

  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide:const  BorderSide(width: 2,color: Colors.green),
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}