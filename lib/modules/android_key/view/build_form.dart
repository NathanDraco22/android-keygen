part of 'android_keygen_screen.dart';


class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
               const Flexible(
                flex: 5,
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
                  child: FilledButton(
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
        )
      ),
    );
  }
}



