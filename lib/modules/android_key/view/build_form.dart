part of 'android_keygen_screen.dart';


class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModel.of(context);
    final formMediatior = viewModel.formMediator;
    return  Padding(
      padding:  const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisSize: MainAxisSize.max,
                children: [
                  TextKeyFormField(
                    labelText: "Alias",
                    centerText: true,
                    onChanged: (value) => formMediatior.alias = value,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RSASelector(
                        onSelected: (p0) => formMediatior.rsa = p0,
                      ),
                      ValidSelector(
                        onSelected: (p0) => formMediatior.valid = p0,
                      )
                    ],
                  )
                ],
              )),
              const SizedBox(width: 20,),
              Flexible(
                flex: 3,
                child: Center(
                  child: FilledButton(
                    onPressed: () async {

                      final (model, msg) = viewModel.executeValidator();
                      if(model == null){
                        await showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: Text(msg),
                          ),
                        );
                        return;
                      }

                      final name = await showDialog<String>(
                        context: context, 
                        builder: (context) => GeneratorAlert(paramsModel: model,),
                      );

                      if(name == null) throw Exception("Name of key is null");
                      if (!context.mounted) return;

                      showDialog(
                          context: context, 
                          builder: (context) => const AlertDialog(
                            title: Text("Creating Key"),
                            content: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(child: CircularProgressIndicator(),)
                            ),
                          ),
                        );

                      await viewModel.executeKeyGen(model, name);
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      final snackBar = SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle_outline_outlined),
                            const SizedBox(width: 20,),
                            Text("$name created !", style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        backgroundColor: Colors.green.shade800,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);


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



