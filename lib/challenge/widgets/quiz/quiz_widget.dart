import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24.0),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AnswerWidget(
              onTap: (value) {
                setState(() {
                  indexSelected = i;
                  widget.onSelected(value);
                });
              },
              answer: awnser(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
            ),
        ],
      ),
    );
  }
}
