import 'answer_item_model.dart';

class QuestionItemModel {
  final String title;
  final List<AnswerItemModel> availableAnswers;

  QuestionItemModel({required this.title, required this.availableAnswers});
}
