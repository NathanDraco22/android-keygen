
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
    this.noSpace = true,
    this.icon,
    this.onChanged
  });

  final String? labelText;
  final bool centerText;
  final bool noSpace;
  final Widget? icon;

  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        onChanged: onChanged,
        textAlign: centerText ? TextAlign.center : TextAlign.start,
        inputFormatters: noSpace ? [FilteringTextInputFormatter.deny(" ")] : null,
        decoration: InputDecoration(
          icon: icon,
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


class RSASelector extends StatelessWidget {
  const RSASelector({super.key, this.onSelected});

  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: "2048",
      onSelected: onSelected,
      label: const Text("RSA"),
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: "1024", 
          label: "1024"
        ),
        DropdownMenuEntry(
          value: "2048", 
          label: "2048"
        ),
      ]
    );
  }
}

class ValidSelector extends StatelessWidget {
  const ValidSelector({super.key, this.onSelected});

  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    final values = List.generate(10, (index) => "${ (index + 1) * 1000 }");
    return DropdownMenu(
      initialSelection: "10000",
      trailingIcon: null,
      onSelected: onSelected,
      label: const Text("Valid"),
      dropdownMenuEntries: values.map(
        (e) => DropdownMenuEntry(value: e, label: e)
      ).toList()
    );
  }
}


class FileExtensionSelector extends StatelessWidget {
  const FileExtensionSelector({super.key, this.onSelected});

  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    String current = ".jks";
    return StatefulBuilder(
      builder: (context, setState) {
        return DropdownButton<String>(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          value: current,
          onChanged: (value) {
            if(onSelected != null){
              onSelected!(value);
            }
            setState(() => current = value!);
          }, 
          items: const [
            DropdownMenuItem(
              value: ".jks", 
              child: Text(".jks")
            ),

            DropdownMenuItem(
              value: ".keystore", 
              child: Text(".keystore")
            ),
          ],
        );
      }
    );
  }
}

