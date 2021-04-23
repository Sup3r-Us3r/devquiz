import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePage createState() => _ChallengePage();
}

class _ChallengePage extends State<ChallengePage> {
  final _controller = ChallengeController();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      _controller.currentPage = _pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (_controller.currentPage < widget.questions.length) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  void onSelected(bool value) {
    if (value) {
      _controller.quantityAnswerRight++;
    }

    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(92.0),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder(
                  valueListenable: _controller.currentPageNotifier,
                  builder: (_, __, ___) {
                    return QuestionIndicatorWidget(
                      currentPage: _controller.currentPage,
                      length: widget.questions.length,
                    );
                  })
            ],
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.questions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: QuizWidget(
              question: widget.questions[index],
              onSelected: onSelected,
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ValueListenableBuilder(
            valueListenable: _controller.currentPageNotifier,
            builder: (_, __, ___) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (_controller.currentPage < widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: 'Pular',
                        onPressed: nextPage,
                      ),
                    ),
                  if (_controller.currentPage == widget.questions.length)
                    SizedBox(width: 7.0),
                  if (_controller.currentPage == widget.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: 'Confirmar',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultPage(
                                title: widget.title,
                                length: widget.questions.length,
                                result: _controller.quantityAnswerRight,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
