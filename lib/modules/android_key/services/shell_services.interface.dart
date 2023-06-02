import '../logic/view_model.dart';

abstract class ShellAdapter{

    Future<String?> genKey( ParamsModel paramModel, String name );


}

