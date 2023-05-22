import "dart:io";
import 'package:process_run/process_run.dart';

import '../logic/view_model.dart';

class ShellService {


  Future<String?> genKey( ParamsModel paramModel )async{

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
      "-srcstorepass ${paramModel.storePass}"];

    final createCommand = createKeyCommand.join(" ");
    final updateCommand = updateKeyCommand.join(" ");
    final shell = Shell().cd(paramModel.jdkPath);
    final createRes = await shell.run(createCommand);
    final updateRes = await shell.run(updateCommand);
    if (createRes.first.exitCode != 0){
      return "error during creation";
    }
    if (updateRes.first.exitCode != 0) {
      return "error during updating";
    }
    shell.kill();
    final separator = Platform.isWindows ? r"\" : "/";
    File newKey = File(paramModel.jdkPath + separator + name );
    File backedKey = File("${paramModel.jdkPath}$separator$name.old");
    await newKey.copy(paramModel.outputPath + separator + name);
    await backedKey.copy("${paramModel.jdkPath}$separator$name.old");
    await newKey.delete();
    await backedKey.delete();
    return null;

  }


}


