// ignore_for_file: prefer_const_constructors

import 'package:button_switch_ui/src/constants/colors_constants.dart';
import 'package:button_switch_ui/src/constants/image_constants.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final double height;
  final double width;
  final Duration animationDuration;
  final bool isLight;
  final Function(bool) onTap;
  const CustomSwitch({
    super.key,
    this.height = 50,
    this.width = 120,
    this.animationDuration = const Duration(milliseconds: 300),
    this.isLight = true,
    required this.onTap,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isLight = true;

  @override
  void initState() {
    super.initState();
    _isLight = widget.isLight;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isLight = !_isLight;
          });
          widget.onTap(_isLight);
        },
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Stack(
            children: [
              AnimatedContainer(
                width: widget.width,
                height: widget.height,
                color: _isLight?colorSunBackground:colorMoonBackground,
                duration: widget.animationDuration,
              ),

              // Sun background
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: _isLight ? 5 : widget.height,
                right: -(widget.width/10),
                width: widget.width,
                child: Image.asset(
                  imgCloud,
                  height: widget.height,
                  width: widget.width,
                  fit: BoxFit.cover,
                ),
              ),

              // Sun
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: -(widget.height/2),
                left: _isLight ? -(widget.height / 2) : (widget.width - (widget.height / 2) - widget.height),
                child: AnimatedOpacity(
                  duration: widget.animationDuration,
                  opacity: _isLight ? 1 : 0,
                  child: SizedBox(
                    height: widget.height*2,
                    width: widget.height * 2,
                    child: OverflowBox(
                      maxHeight: widget.height * 2,
                      child: Image.asset(
                        imgSun,
                      ),
                    ),
                  ),
                ),
              ),

              // Moon background
              AnimatedPositioned(
                duration: widget.animationDuration,
                bottom: !_isLight ? 0 : widget.height,
                left: 5,
                height: widget.height,
                child: Image.asset(
                  imgStars,
                  width: widget.height,
                  fit: BoxFit.fitWidth,
                ),
              ),

              // Sun
              AnimatedPositioned(
                duration: widget.animationDuration,
                top: -(widget.height/2),
                left: _isLight ?  -(widget.height / 2) : (widget.width  - (widget.height / 2) - widget.height),
                child: AnimatedOpacity(
                  duration: widget.animationDuration,
                  opacity: !_isLight ? 1 : 0,
                  child: SizedBox(
                    height: widget.height*2,
                    width: widget.height*2,
                    child: OverflowBox(
                      maxHeight: widget.height * 2,
                      child: Image.asset(
                        imgMoon,
                      ),
                    ),
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
