import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/services/shell_services.dart';

class ViewModel extends InheritedWidget {
  ViewModel({super.key, required Widget child}) : super(child: child);

  final formMediator = FormMediator();
  final shellService = ShellService();

  Future<String?> executeKeyGen()async{

    final map = formMediator._createMap();

    for(final entry in  map.entries) {
      final MapEntry(:key, :value) = entry;
      if(value == null) {
        return "the field $key is Empty";
      }
    }

    final paramModel = ParamsModel.fromJsonMap(map);

    if (paramModel.keyPass.length < 6 || paramModel.storePass.length < 6 ){
      return "Password greater than 6 character";
    }

    return await shellService.genKey(paramModel);

  }


  
  static ViewModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModel>()!;
  }

  @override
  bool updateShouldNotify(ViewModel oldWidget) {
    return false;
  }
}


class FormMediator {

  String? jdkPath;
  String? outputPath;

  String? companyName;
  String? organizationalUnit;
  String? organization;
  String? location;
  String? state;
  String? countryCode;
  String? storePass;
  String? keyPass;

  String? alias;
  String? rsa;
  String? valid;

    Map<String,dynamic> _createMap(){
    return {
      "jdkPath" : jdkPath,
      "outputPath" : outputPath,
      "companyName" : companyName,
      "organizationalUnit" : organizationalUnit,
      "organization" : organization,
      "location" : location,
      "state" : state,
      "countryCode" : countryCode,
      "storePass" : storePass,
      "keyPass" : keyPass,
      "alias" : alias,
      "rsa" : rsa,
      "valid" : valid,

    };
  }

  @override
  String toString() {
    return '''
jdkPath : $jdkPath
outputPath : $outputPath
companyName : $companyName
organizationalUnit : $organizationalUnit
organization : $organization
location : $location
state : $state
countryCode : $countryCode
storePass : $storePass
keyPass : $keyPass
alias : $alias
rsa : $rsa
valid : $valid
''';
  }

}

class ParamsModel {

  ParamsModel.fromJsonMap(Map jsonMap) 
  : 
    jdkPath = jsonMap["jdkPath"],
    outputPath = jsonMap["outputPath"],
    companyName = jsonMap["companyName"],
    organizationalUnit = jsonMap["organizationalUnit"],
    organization = jsonMap["organization"],
    location = jsonMap["location"],
    state = jsonMap["state"],
    countryCode = jsonMap["countryCode"],
    storePass = jsonMap["storePass"],
    keyPass = jsonMap["keyPass"],
    alias = jsonMap["alias"],
    rsa = jsonMap["rsa"],
    valid = jsonMap["valid"];


  String jdkPath;
  String outputPath;
  String companyName;
  String organizationalUnit;
  String organization;
  String location;
  String state;
  String countryCode;
  String storePass;
  String keyPass;
  String alias;
  String rsa;
  String valid;



}