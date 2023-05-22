import "dart:io";
import 'package:process_run/process_run.dart';

import '../logic/view_model.dart';

class ShellService {


  Future<void> genKey( ParamsModel paramModel )async{

    const name = "algo.keystore";

    List<String> createKeyCommand =  [
      "keytool", 
      "-genkey",
      "-v",
      "-keystore $name",
      "-alias ${paramModel.alias}",
      "-keyalg RSA",
      "-keysize ${paramModel.rsa}",
      "-sigalg SHA1withRSA",
      "-validity ${paramModel.valid}",
      "-dname 'CN=${paramModel.companyName}, OU=${paramModel.organizationalUnit}, O=${paramModel.organization}, L=${paramModel.location}, S=${paramModel.state}, C=${paramModel.countryCode}'",
      "-storepass ${paramModel.storePass}",
      "-keypass ${paramModel.keyPass}"
    ];

      List<String>updateKeyCommand = [
      "keytool",
      "-importkeystore",
      "-srckeystore $name",
      "-destkeystore $name",
      "-deststoretype pkcs12",
      "-srcstorepass 123456"];

      final createCommand = createKeyCommand.join(" ");
      final updateCommand = updateKeyCommand.join(" ");

      final shell = Shell().cd(paramModel.jdkPath);

      await shell.run(createCommand);
      await shell.run(updateCommand);

      shell.kill();

      File newKey = File(paramModel.jdkPath + r"\" + name );
      File backedKey = File(paramModel.jdkPath + r"\" + "$name.old");

      await newKey.copy(paramModel.outputPath + r"\" + name);
      await backedKey.copy(paramModel.outputPath + r"\" + "$name.old");

      await newKey.delete();
      await backedKey.delete();



  }


}


