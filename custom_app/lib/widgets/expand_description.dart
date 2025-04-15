import 'package:flutter/material.dart';


class ExpandDescription extends StatefulWidget{
  final String text;
  final int trimLines;

  const ExpandDescription({required this.text, this.trimLines = 3});

  @override 
    State<ExpandDescription> createState() => _ExpandDescriptionState();
}

class _ExpandDescriptionState extends State<ExpandDescription>{

  bool isExpanded = false;

  @override
  Widget build(BuildContext contex){

  final defaultStyle = TextStyle(
           fontSize: 16, 
           color: Colors.black);
  
  return LayoutBuilder(
    builder: (contex, size) {

      final span = TextSpan(text: widget.text, style: defaultStyle);
      final textPainter = TextPainter(
        text: span,
        maxLines: widget.trimLines,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: size.maxWidth);

     final exceed = textPainter.didExceedMaxLines;

     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isExpanded
        ? ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 92), 
            child: SingleChildScrollView(
              child: Text(
                widget.text,
                style: defaultStyle,
              ),
            ),
          )
        : Text(
            widget.text,
            style: defaultStyle,
            maxLines: widget.trimLines,
            overflow: TextOverflow.fade,
          ),
        if(exceed)
          GestureDetector(
            onTap:() {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                isExpanded ? 'Read less' : 'Read more',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
              )
            ),
          ),
       ],
      );
    });


  }

}