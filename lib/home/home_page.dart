import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  HomePage({Key? key}) : super(key: key);
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();

    _controller.getUser();
    _controller.getQuizzes();
    _controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: _controller.user!),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.0),
              height: 32.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final levels = ['Fácil', 'Médio', 'Difício', 'Perito'];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: LevelButtonWidget(label: levels[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 24.0),
            // Expanded(child: QuizCardWidget()),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                itemCount: _controller.quizzes!.length,
                itemBuilder: (context, index) {
                  final quiz = _controller.quizzes![index];

                  return QuizCardWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ChallengePage(
                          questions: quiz.questions,
                          title: quiz.title,
                        ),
                      ));
                    },
                    image: quiz.image,
                    title: quiz.title,
                    completed:
                        '${quiz.questionAnswered}/${quiz.questions.length}',
                    percent: quiz.questionAnswered / quiz.questions.length,
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColors.purple,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
          ),
        ),
        backgroundColor: AppColors.white,
      );
    }
  }
}

// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 20.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       LevelButtonWidget(label: 'Fácil'),
//       LevelButtonWidget(label: 'Médio'),
//       LevelButtonWidget(label: 'Difício'),
//       LevelButtonWidget(label: 'Perito'),
//     ],
//   ),
// ),
