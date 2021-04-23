import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({Key? key, required this.label})
      : assert(['Fácil', 'Médio', 'Difício', 'Perito'].contains(label)),
        super(key: key);

  final config = {
    'Fácil': {
      'color': AppColors.levelButtonEasy,
      'borderColor': AppColors.levelButtonBorderEasy,
      'fontColor': AppColors.levelButtonTextEasy,
    },
    'Médio': {
      'color': AppColors.levelButtonMedium,
      'borderColor': AppColors.levelButtonBorderMedium,
      'fontColor': AppColors.levelButtonTextMedium,
    },
    'Difício': {
      'color': AppColors.levelButtonHard,
      'borderColor': AppColors.levelButtonBorderHard,
      'fontColor': AppColors.levelButtonTextHard,
    },
    'Perito': {
      'color': AppColors.levelButtonExpert,
      'borderColor': AppColors.levelButtonBorderExpert,
      'fontColor': AppColors.levelButtonTextExpert,
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28.0),
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 26.0),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }
}
