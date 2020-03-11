import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//SingleTickerProvider gives widget ability to act as a ticker
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;

  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    //adds a curve to animation for adjustment of speed/acceleration
    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    //animates color between 2 values
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);


    controller.forward();

    //tracks when animation completes
    animation.addStatusListener((status) {
      //adds an event when status is completed
//      if(status == AnimationStatus.completed) {
//        controller.reverse(from: 1.0);
//      }
    });

    //reverses the animation
    //controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  //disposes animation when go to another screen
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'registration');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
