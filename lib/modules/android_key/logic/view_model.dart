import 'package:flutter/material.dart';

class ViewModel extends InheritedWidget {
  ViewModel({super.key, required Widget child}) : super(child: child);

  final formMediator = FormMediatior();
  
  static ViewModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModel>()!;
  }

  @override
  bool updateShouldNotify(ViewModel oldWidget) {
    return false;
  }
}


class FormMediatior {

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

}