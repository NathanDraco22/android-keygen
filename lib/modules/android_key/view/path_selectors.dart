

part of 'android_keygen_screen.dart';


class _PathSelectors extends StatelessWidget {
  const _PathSelectors();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         DirPickWidget(textLabel: "JDK path" ,onDirPicked: print,),
         DirPickWidget(textLabel: "Output path" ,onDirPicked: print,),
      ],
    );
  }
}
