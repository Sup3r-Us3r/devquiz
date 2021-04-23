import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  ChartWidget({Key? key, required this.percent}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation =
        Tween<double>(begin: 0.0, end: widget.percent).animate(_controller);

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                child: CircularProgressIndicator(
                  strokeWidth: 10.0,
                  value: _animation.value / 100,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
              Text(
                '${_animation.value.toInt()}%',
                style: AppTextStyles.heading,
              ),
            ],
          );
        },
      ),
    );
  }
}
