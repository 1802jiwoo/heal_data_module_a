import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';
import 'package:module_a_practice2/presentation/providers/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashProvider.addListener(updateScreen);
      splashProvider.animationStart(context);
    },);
  }

  @override
  void dispose() {
    splashProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: splashProvider.isLogoStart ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Image.asset('assets/images/symbol.png', width: MediaQuery.sizeOf(context).width * 0.38,),
            ),
            AnimatedSlide(
              offset: Offset(0, splashProvider.isTextStart ? 0 : 1),
              duration: Duration(seconds: 1),
              child: Text('MY Health DATA', style: titleLarge.black),
            ),
          ],
        ),
      ),
    );
  }
}
