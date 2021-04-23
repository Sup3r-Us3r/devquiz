import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AppImages.trophy, fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(height: 16.0),
                Text.rich(
                  TextSpan(
                    text: 'Você concluiu\n',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: '$title\n',
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: 'com $result de $length acertos.',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 68.0),
                  height: 48.0,
                  width: double.maxFinite,
                  child: NextButtonWidget.purple(
                    label: 'Compartilhar',
                    onPressed: () {
                      Share.share(
                        'DevQuiz: Acertei $result de $length perguntas no quiz do Flutter',
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 68.0),
                  height: 48.0,
                  width: double.maxFinite,
                  child: NextButtonWidget.transparent(
                    label: 'Voltar ao início',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
