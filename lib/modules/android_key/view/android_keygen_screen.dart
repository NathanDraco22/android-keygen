import 'package:flutter/material.dart';
import 'widgets.dart';

part 'path_selectors.dart';
part 'keygen_form.dart';
part 'build_form.dart';

class AndroidKeygenScreen extends StatelessWidget {
  const AndroidKeygenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1, 
        centerTitle: true,
        title: const Column(
          children: [
            Icon(Icons.android), 
            Text("KeyGenerator")]
          ),
        ),
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
    );
  }
}

