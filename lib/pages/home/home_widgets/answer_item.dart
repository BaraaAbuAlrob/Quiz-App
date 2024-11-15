import 'package:flutter/material.dart';

import '../models/answer_item_model.dart';

class AnswerItem extends StatelessWidget {
  final AnswerItemModel answerMap;
  final bool isAnswerChosen;
  final VoidCallback questionIndexChangeCallback;
  const AnswerItem({
    super.key,
    required this.answerMap,
    required this.isAnswerChosen,
    required this.questionIndexChangeCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          answerMap.onPressed();
          questionIndexChangeCallback();
        },
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isAnswerChosen ? Colors.blueAccent : Colors.white54,
              border: Border.all(
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: isAnswerChosen ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 16.0),
                  Text(answerMap.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isAnswerChosen ? Colors.white : Colors.black,
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
