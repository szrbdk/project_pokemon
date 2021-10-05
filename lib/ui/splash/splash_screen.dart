import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_pokemon/utilities/extensions/extensions.dart'
    show BuildContextExtension;

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPortrait = context.mquery.orientation == Orientation.portrait;
    double size = isPortrait
        ? context.mquery.size.width * 0.6
        : context.mquery.size.height * 0.6;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_mrg9xhbm.json',
            repeat: true,
          ),
        ),
      ),
    );
  }
}

//