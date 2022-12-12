import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // )..addListener(() {
    //     setState(() {});
    //   });
    // controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              CircularProgressIndicator(
                // value: controller.value,
                // semanticsLabel: 'Circular progress indicator',
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
