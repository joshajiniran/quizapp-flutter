import 'question.dart';

class QuizBrain {
  int _qIndex = 0;

  List<Question> _questions = [
    Question('Eminem is the fastest rapper as of the year 2020?', true),
    Question('The best rapper in Nigeria is M.I Abaga?', true),
    Question('The first woman to drive a car in Nigeria is Stella Obasanjo??',
        false),
    Question('An oxen is a male cow?', true),
    Question('The tallest building in the world is the Eiffel\'s tower?', true),
  ];

  String getQuestionText() {
    return _questions[_qIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_qIndex].questionAnswer;
  }

  void nextQuestion() {
    if (_qIndex < _questions.length - 1) {
      _qIndex++;
    }
  }
}