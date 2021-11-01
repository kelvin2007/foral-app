import 'package:flutter/material.dart';
import 'package:foral/home-screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetStarted(),
      ),
    );
  }
}


class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/background.png'),
              Positioned(
                bottom: 10,
                child: FloatingImage(),
              )
            ],
          ),
        ),
        SizedBox(height: 45,),
        Image.asset(
            'assets/title.png',
            height: 76,
            fit:BoxFit.cover
        ),
        SizedBox(height: 5,),
        Center(
          child: Text(
            'Forum for All Indonesian Students',
            style: TextStyle(
              fontFamily: 'Roboto-Light',
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 30,),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          },
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 279,
              minHeight: 58,
              maxWidth: 279,
              maxHeight: 58,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontFamily: 'Roboto-Bold',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Center(
          child: Text(
            'Made with ❤ by kelvin',
            style: TextStyle(
              fontFamily: 'Roboto-Light',
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class FloatingImage extends StatefulWidget{
  @override
  _FloatingImage createState() => _FloatingImage();
}

class _FloatingImage extends State<FloatingImage> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
      vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0,0.07),
  ).animate(CurvedAnimation(parent: _controller, curve:Curves.easeInOut));

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SlideTransition(
      position: _animation,
      child: Image.asset('assets/man-cloud.png'),
    );
  }
}