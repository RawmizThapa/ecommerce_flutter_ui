import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/main_screens/supplier_home.dart';
import 'package:amazon_clone/widgets/yellow_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

const textColor = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const textStyle = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Acme',
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/inapp/bgimage.jpg'), fit: BoxFit.cover),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'WELCOME',
                    textStyle: textStyle,
                    colors: textColor,
                  ),
                  ColorizeAnimatedText(
                    'DUCK STORE',
                    textStyle: textStyle,
                    colors: textColor,
                  )
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              const SizedBox(
                  height: 120,
                  width: 200,
                  child: Image(image: AssetImage('images/inapp/logo.jpg'))),
              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Acme',
                    color: Colors.lightBlueAccent,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('Duck Store'),
                    ],
                  ),
                ),
              ),
              // const Text(
              //   'SHOP',
              //   style: TextStyle(color: Colors.white, fontSize: 30),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Suppliers Only',
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.yellowAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedLogo(controller: _controller),
                            YellowButton(
                                label: 'Log In',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/supplier_home');
                                },
                                width: 0.25),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: YellowButton(
                                  label: 'Sign Up',
                                  onPressed: () {},
                                  width: 0.25),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: YellowButton(
                              label: 'Log In',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              width: 0.25),
                        ),
                        YellowButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_signup');
                            },
                            width: 0.25),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/google.jpg')),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: const Image(
                            image: AssetImage('images/inapp/facebook.jpg')),
                      ),
                      processing == true
                          ? const CircularProgressIndicator()
                          : GoogleFacebookLogin(
                              label: 'Guest',
                              onPressed: () async {
                                // setState(() {
                                //   processing = true;
                                // });
                                await FirebaseAuth.instance.signInAnonymously();
                                Navigator.pushReplacementNamed(
                                    context, '/customer_home');
                              },
                              child: const Icon(Icons.person,
                                  size: 55, color: Colors.lightBlueAccent))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: const Image(image: AssetImage('images/inapp/logo.jpg')),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;
  const GoogleFacebookLogin({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: child,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
