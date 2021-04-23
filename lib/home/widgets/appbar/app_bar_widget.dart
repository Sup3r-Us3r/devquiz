import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/core/core.dart';

import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({Key? key, required this.user})
      : super(
          key: key,
          preferredSize: Size.fromHeight(250.0),
          child: Container(
            height: 260.0,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Olá, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 58.0,
                        width: 58.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCardWidget(percent: user.score.toDouble()),
                ),
              ],
            ),
          ),
        );
}
