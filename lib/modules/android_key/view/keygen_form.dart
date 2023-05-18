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
                      TextKeyFormField(),
                      TextKeyFormField(),
                      TextKeyFormField(),
          
                    ],
                  ),
                ),
                SizedBox(width: 20,),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextKeyFormField(),
                      TextKeyFormField(),
                      TextKeyFormField(),
          
                      
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          TextKeyFormField(),
          SizedBox(height: 15,),
          TextKeyFormField(),
        ],
      )
    );
  }
}
