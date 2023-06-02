import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keytool_app/modules/android_key/logic/view_model.dart';

import 'shell_services.mock.dart';

void main() {

  group("viewmodel ->", () {

    late ViewModel viewModel;
    setUp((){
      final mockShellServices = MockShellServices();
      final formMediator = FormMediator(); 
      viewModel = ViewModel(mockShellServices, formMediator, child: const Placeholder());
    });

    test("test validator success", () {
      viewModel.formMediator
        ..jdkPath = "path"
        ..outputPath = "path"
        ..companyName = "company"
        ..location = "wherever"
        ..organizationalUnit = "no-unit"
        ..organization = "secret"
        ..state = "kanto"
        ..countryCode = "PK"
        ..storePass = "123qwerty"
        ..keyPass = "123qwerty"
        ..alias = "alias";

        final (paramsModel, msg) = viewModel.executeValidator();

        expect(paramsModel.runtimeType, equals(ParamsModel));
        expect(msg, equals(""));
      
    },);

    test("test validator error", () {

      final (paramsModel, msg ) = viewModel.executeValidator();

      expect(paramsModel, equals(null));
      expect(msg.runtimeType, equals(String));
      expect(msg, equals("the field jdkPath is Empty"));

    });

    test("test validator error short password", () {
      viewModel.formMediator
        ..jdkPath = "path"
        ..outputPath = "path"
        ..companyName = "company"
        ..location = "wherever"
        ..organizationalUnit = "no-unit"
        ..organization = "secret"
        ..state = "kanto"
        ..countryCode = "PK"
        ..storePass = "123"
        ..keyPass = "123"
        ..alias = "alias";

        final (paramsModel, msg) = viewModel.executeValidator();

        expect(paramsModel, equals(null));
        expect(msg, equals("Password must be at least 6 characters"));
    },);

    test("test genkey success", () async {
      viewModel.formMediator
        ..jdkPath = "path"
        ..outputPath = "path"
        ..companyName = "company"
        ..location = "wherever"
        ..organizationalUnit = "no-unit"
        ..organization = "secret"
        ..state = "kanto"
        ..countryCode = "PK"
        ..storePass = "123qwerty"
        ..keyPass = "123qwerty"
        ..alias = "alias";

        final (paramsModel, _) = viewModel.executeValidator();
        final res = await viewModel.executeKeyGen(paramsModel!, "name");

        expect(res, equals(null));

    },);

    test("test genkey error", () async {
      viewModel.formMediator
        ..jdkPath = "path"
        ..outputPath = "path"
        ..companyName = "company"
        ..location = "wherever"
        ..organizationalUnit = "no-unit"
        ..organization = "secret"
        ..state = "kanto"
        ..countryCode = "PK"
        ..storePass = "123qwerty"
        ..keyPass = "123qwerty"
        ..alias = "alias";

        final (paramsModel, _) = viewModel.executeValidator();
        final res = await viewModel.executeKeyGen(paramsModel!, "error");

        expect(res, equals("error"));

    },);

   });

}



