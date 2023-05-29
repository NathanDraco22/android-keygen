import 'package:flutter/material.dart';
import 'package:keytool_app/modules/android_key/view/alerts.dart';

import 'widgets.dart';
import '../logic/view_model.dart';

part 'path_selectors.dart';
part 'keygen_form.dart';
part 'build_form.dart';

class AndroidKeygenScreen extends StatelessWidget {
  const AndroidKeygenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModel(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: _PathSelectors(),
                ),
              ),
    
              Flexible(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const KeygenForm())
              ),
    
              const SizedBox(height: 8,),
    
              Flexible(
                flex: 3,
                child: 
                Container(
                  decoration: BoxDecoration(
                    color : Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const _BuildForm(),
                )
              )

            ],
          ),
        )
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      elevation: 1, 
      centerTitle: true,
      title: const Column(
        children: [
          Icon(Icons.android), 
          Text("KeyGenerator")]
        ),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

