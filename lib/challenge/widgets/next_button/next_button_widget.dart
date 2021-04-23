import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color overlayColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onPressed;

  NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.overlayColor,
    required this.fontColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  NextButtonWidget.green({
    required String label,
    required VoidCallback onPressed,
  })   : this.label = label,
        this.backgroundColor = AppColors.darkGreen,
        this.overlayColor = AppColors.green.withOpacity(.3),
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onPressed = onPressed;

  NextButtonWidget.white({
    required String label,
    required VoidCallback onPressed,
  })   : this.label = label,
        this.backgroundColor = AppColors.white,
        this.overlayColor = AppColors.lightGrey.withOpacity(.1),
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onPressed = onPressed;

  NextButtonWidget.purple({
    required String label,
    required VoidCallback onPressed,
  })   : this.label = label,
        this.backgroundColor = AppColors.purple,
        this.overlayColor = AppColors.purple.withOpacity(.1),
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.purple,
        this.onPressed = onPressed;

  NextButtonWidget.transparent({
    required String label,
    required VoidCallback onPressed,
  })   : this.label = label,
        this.backgroundColor = Colors.transparent,
        this.overlayColor = Colors.transparent,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
