part of 'android_keygen_screen.dart';

class KeygenForm extends StatelessWidget{
  const KeygenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formMediator = ViewModel.of(context).formMediator;
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextKeyFormField(
                        labelText: "Company_Name",
                        onChanged: (value) => formMediator.companyName = value,
                      ),
                      TextKeyFormField(
                        labelText: "Organizational_Unit",
                        onChanged: (value) => formMediator.organizationalUnit = value,
                      ),
                      TextKeyFormField(
                        labelText: "Organization",
                        onChanged: (value) => formMediator.organization = value,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20,),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextKeyFormField(
                        labelText: "Location",
                        onChanged: (value) => formMediator.location = value,  
                      ),
                      TextKeyFormField(
                        labelText: "State/Province/Country",
                        onChanged: (value) => formMediator.state = value,
                      ),
                      TextKeyFormField(
                        labelText: "Country-Code",
                        onChanged: (value) => formMediator.countryCode = value,
                      ),                     
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 28,),
          TextKeyFormField(
            labelText: "Store_Password", 
            icon: const Icon(Icons.lock_outline),
            onChanged: (value) => formMediator.storePass = value,
          ),
          const SizedBox(height: 20,),
          TextKeyFormField(
            labelText: "Key_Password", 
            icon:  const Icon(Icons.lock_person),
            onChanged: (value) => formMediator.keyPass = value,
          ),
        ],
      )
    );
  }
}
