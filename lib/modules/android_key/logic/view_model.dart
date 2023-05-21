import 'package:flutter/material.dart';

class ViewModel extends InheritedWidget {
  ViewModel({super.key, required Widget child}) : super(child: child);

  final formMediator = FormMediator();

  Future<void> executeKeyGen()async{

    print(formMediator);

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