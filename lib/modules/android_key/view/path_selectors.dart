

part of 'android_keygen_screen.dart';


class _PathSelectors extends StatelessWidget {
  const _PathSelectors();

  @override
  Widget build(BuildContext context) {
    final formMediator = ViewModel.of(context).formMediator;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         DirPickWidget(textLabel: "JDK path" ,onDirPicked:(path) => formMediator.jdkPath = path, ),
         DirPickWidget(textLabel: "Output path" ,onDirPicked: (path) => formMediator.outputPath = path,),
      ],
    );
  }
}
