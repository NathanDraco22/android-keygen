
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
    this.labelText,
    this.centerText = false,
    this.noSpace = true
  });

  final String? labelText;
  final bool centerText;
  final bool noSpace;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlign: centerText ? TextAlign.center : TextAlign.start,
        inputFormatters: noSpace ? [FilteringTextInputFormatter.deny(" ")] : null,
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}



class ValidSelector extends StatelessWidget {
  const ValidSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final values = List.generate(10, (index) => "${ (index + 1) * 1000 }");
    return DropdownMenu(
      trailingIcon: null,
      onSelected: print,
      label: const Text("Valid"),
      dropdownMenuEntries: values.map(
        (e) => DropdownMenuEntry(value: e, label: e)
      ).toList()
    );
  }
}