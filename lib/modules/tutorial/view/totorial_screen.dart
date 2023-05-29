import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final (duration, curve) = (const Duration(milliseconds: 200), Curves.easeOutSine);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _CustomPageView(controller: controller),
          Positioned(
            bottom: 16,
            child: _NavigationPages(controller: controller, duration: duration, curve: curve),
          ),
          const Positioned(
            top: 4,
            left: 4,
            child: _CloseButton()
          ),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
        style: FilledButton.styleFrom(padding: EdgeInsets.zero, backgroundColor: Colors.black38),
        onPressed: () => Navigator.pop(context), 
        child: const Icon(Icons.close),
      );
  }
}

class _NavigationPages extends StatelessWidget {
  const _NavigationPages({
    required this.controller,
    required this.duration,
    required this.curve,
  });

  final PageController controller;
  final Duration duration;
  final Cubic curve;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => controller.previousPage(duration: duration, curve: curve), 
            icon: const Icon(Icons.chevron_left_rounded)
          ),
          IconButton(
            onPressed: () => controller.nextPage(duration: duration, curve: curve ), 
            icon: const Icon(Icons.chevron_right_rounded)
          ),
        ],
      ),
    );
  }
}

class _CustomPageView extends StatelessWidget {
  const _CustomPageView({
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        Container(color: Colors.blueGrey,),
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
        Container(color: Colors.red,),
      ],
    );
  }
}




