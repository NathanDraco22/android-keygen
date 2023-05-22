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
                      final result = await viewModel.executeKeyGen();

                      if (!context.mounted) return;
                      if(result == null ) return;

                         showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: const Text("Error"),
                            content: Text(result),
                          ),
                        );
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



