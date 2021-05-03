library scroll_indicator;

import 'package:flutter/material.dart';

class ScrollIndicator extends StatefulWidget {
  final ScrollController scrollController;
  final double width, height, indicatorWidth;
  final Decoration decoration, indicatorDecoration;
  ScrollIndicator(
      {required this.scrollController,
      this.width = 100,
      this.height = 10,
      this.indicatorWidth = 20,
      this.decoration = const BoxDecoration(color: Colors.black26),
      this.indicatorDecoration = const BoxDecoration(color: Colors.black)});

  @override
  _ScrollIndicatorState createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double pixels = 0.0;
  double widthContainer = 0.0;
  double currentPixel = 0.0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      pixels = widget.scrollController.position.pixels;
      widthContainer =
          widget.scrollController.position.maxScrollExtent / widget.width;
      currentPixel = (pixels / widthContainer);

      // debugPrint(
      //     'current ' + widget.scrollController.position.pixels.toString());
      // debugPrint(
      //     'max ' + widget.scrollController.position.maxScrollExtent.toString());
      // debugPrint('widthContainer ' +
      //     (widget.scrollController.position.maxScrollExtent / width)
      //         .toString());
      // debugPrint('currentPixel ' + (pixels / widthContainer).toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width + widget.indicatorWidth,
      decoration: widget.decoration,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              left: currentPixel,
              child: Container(
                height: widget.height,
                width: widget.indicatorWidth,
                decoration: widget.indicatorDecoration,
              )),
        ],
      ),
    );
  }
}
