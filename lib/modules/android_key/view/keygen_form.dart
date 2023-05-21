part of 'android_keygen_screen.dart';

class KeygenForm extends StatelessWidget{
  const KeygenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      TextKeyFormField(labelText: "Company_Name",),
                      TextKeyFormField(labelText: "Organizational_Unit",),
                      TextKeyFormField(labelText: "Organization",),
          
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextKeyFormField(labelText: "Location",),
                      TextKeyFormField(labelText: "State/Province/Country",),
                      TextKeyFormField(labelText: "Country-Code",),                     
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 28,),
          TextKeyFormField(labelText: "Store_Password", icon: Icon(Icons.lock_outline),),
          SizedBox(height: 20,),
          TextKeyFormField(labelText: "Key_Password", icon:  Icon(Icons.lock_person),),
        ],
      )
    );
  }
}
