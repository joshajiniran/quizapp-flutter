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
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
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

  bool isFinished() {
    if (_qIndex == _questions.length - 1) {
      print('True');
      return true;
    } else {
      print('False');
      return false;
    }
  }

  void reset() {
    _qIndex = 0;
  }
}
