import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  // const Sandbox({Key? key}) : super(key: key);

  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("Animate Margin"),
                onPressed: () {
                  setState(() => _margin = 30);
                },
              ),
              SizedBox(width: 10),
              RaisedButton(
                child: Text("Animate Color"),
                onPressed: () =>
                    setState(() => _color = Colors.deepPurpleAccent),
              ),
              SizedBox(width: 10),
              RaisedButton(
                child: Text("Animate Width"),
                onPressed: () => setState(() => _width = 350),
              ),
              SizedBox(width: 10),
              RaisedButton(
                onPressed: () => setState(() => _opacity = 0),
                child: Text("Animate Opacity"),
              ),
              SizedBox(width: 10),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  "Hide and Seek",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
