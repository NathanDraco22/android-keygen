part of 'android_keygen_screen.dart';


class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Flexible(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   mainAxisSize: MainAxisSize.max,
                  children: [
                    TextKeyFormField(
                      labelText: "Alias",
                      centerText: true
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RSASelector(),
                        ValidSelector()
                      ],
                    )
                  ],
                )),
                const SizedBox(width: 20,),
                Flexible(
                  flex: 3,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      }, 
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Generate"),
                          Icon(Icons.key)
                        ],
                      )
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}


class RSASelector extends StatelessWidget {
  const RSASelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const DropdownMenu(
      onSelected: print,
      label: Text("RSA"),
      dropdownMenuEntries: [
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
