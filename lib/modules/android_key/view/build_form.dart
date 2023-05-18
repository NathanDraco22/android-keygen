part of 'android_keygen_screen.dart';


class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(child: TextField()),
                SizedBox(width: 20,),
                Flexible(child: TextField()),
              ],
            ),
          ],
        )
      ),
    );
  }
}
