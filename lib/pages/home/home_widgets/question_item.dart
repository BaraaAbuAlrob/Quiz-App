import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home/models/question_item_model.dart';

class QuestionItem extends StatelessWidget {
  final QuestionItemModel questionItem;
  final bool isDarkMode;

  const QuestionItem({
    super.key,
    required this.questionItem,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questionItem.title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
            ),
            const SizedBox(height: 12.0),
            Text(
              'Answer and get points',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      );
}
