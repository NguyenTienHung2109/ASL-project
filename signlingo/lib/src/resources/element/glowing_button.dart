import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final double height_button;
  final double width_button;
  final String text_button;
  final VoidCallback  event_button;
  

  const GlowingButton({Key? key, this.color1 = Colors.blue, this.color2 = Colors.green, 
  this.height_button = 48, this.width_button = 160, this.text_button = "button", 
  required this.event_button}) : super(key: key);
  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var glowing = true;
  var scale = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.05;
        });
      },
      onTap: widget.event_button,
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: Duration(milliseconds: 200),
        height: widget.height_button,
        width: widget.width_button,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              widget.color1,
              widget.color2,
          ]),
          boxShadow: glowing?[
            BoxShadow(
              color: widget.color1.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 16,
              offset: Offset(-8, 0)
            ),
            BoxShadow(
              color: widget.color2.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 16,
              offset: Offset(8, 0)
            ),
            BoxShadow(
              color: widget.color1.withOpacity(0.2),
              spreadRadius: 16,
              blurRadius: 32,
              offset: Offset(-8, 0)
            ),
            BoxShadow(
              color: widget.color2.withOpacity(0.2),
              spreadRadius: 16,
              blurRadius: 32,
              offset: Offset(8, 0)
            )
          ]:[]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text_button,
              style: TextStyle(color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600),)
            ],
          ),
      ),
    );
  }
}