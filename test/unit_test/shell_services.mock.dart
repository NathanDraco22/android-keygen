



import 'package:keytool_app/modules/android_key/logic/view_model.dart';
import 'package:keytool_app/modules/android_key/services/shell_services.interface.dart';

class MockShellServices implements ShellAdapter{
  @override
  Future<String?> genKey(ParamsModel paramModel, String name) async {
    if(name == "error") return name;
    return null;
  }




}

