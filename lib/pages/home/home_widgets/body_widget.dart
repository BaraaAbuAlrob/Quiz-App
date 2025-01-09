import 'package:flutter/material.dart';

import '../../common/common_functions.dart';
import '../models/answer_item_model.dart';
import '../models/question_item_model.dart';
import 'answer_item.dart';
import 'question_item.dart';

class BodyWidget extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleThemeMode;

  const BodyWidget({
    super.key,
    required this.isDarkMode,
    required this.toggleThemeMode,
  });

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  int questionIndex = 0, myTotalScore = 0, answerChosen = -1;
  late int resultScore;
  bool showTotalScore = false;

  late List<QuestionItemModel> questions;

  @override
  void initState() {
    questions = [
      QuestionItemModel(
        title: 'What is your favorite sport?',
        availableAnswers: [
          AnswerItemModel(
            title: 'Football',
            onPressed: () => showSnackBar(context, 'Football Pressed!'),
          ),
          AnswerItemModel(
            title: 'Basketball',
            onPressed: () => showSnackBar(context, 'Basketball Pressed!'),
          ),
          AnswerItemModel(
            title: 'Swimming',
            onPressed: () => showSnackBar(context, 'Swimming Pressed!'),
          ),
          AnswerItemModel(
            title: 'Running',
            onPressed: () => showSnackBar(context, 'Running Pressed!'),
          ),
        ],
      ),
      QuestionItemModel(
        title: 'What is your favorite color?',
        availableAnswers: [
          AnswerItemModel(
            title: 'Black',
            onPressed: () => showSnackBar(context, 'Black Pressed!'),
          ),
          AnswerItemModel(
            title: 'White',
            onPressed: () => showSnackBar(context, 'White Pressed!'),
          ),
          AnswerItemModel(
            title: 'Green',
            onPressed: () => showSnackBar(context, 'Green Pressed!'),
          ),
          AnswerItemModel(
            title: 'Red',
            onPressed: () => showSnackBar(context, 'Red Pressed!'),
          ),
          AnswerItemModel(
            title: 'Blue',
            onPressed: () => showSnackBar(context, 'Blue Pressed!'),
          ),
        ],
      ),
      QuestionItemModel(
        title: 'What is your favorite food?',
        availableAnswers: [
          AnswerItemModel(
            title: 'Chicken',
            onPressed: () => showSnackBar(context, 'Chicken Pressed!'),
          ),
          AnswerItemModel(
            title: 'Beef',
            onPressed: () => showSnackBar(context, 'Beef Pressed!'),
          ),
          AnswerItemModel(
            title: 'Fish',
            onPressed: () => showSnackBar(context, 'Fish Pressed!'),
          ),
          AnswerItemModel(
            title: 'Vegetables',
            onPressed: () => showSnackBar(context, 'Vegetables Pressed!'),
          ),
          AnswerItemModel(
            title: 'Fruits',
            onPressed: () => showSnackBar(context, 'Fruits Pressed!'),
          ),
          // AnswerItemModel(
          //   title: 'Lamb',
          //   onPressed: () => showSnackBar(context, 'Lamb Pressed!'),
          // ),
          // AnswerItemModel(
          //   title: 'Pork',
          //   onPressed: () => showSnackBar(context, 'Pork Pressed!'),
          // ),
        ],
      ),
      QuestionItemModel(
        title: 'What is your favorite animal?',
        availableAnswers: [
          AnswerItemModel(
            title: 'Lion',
            onPressed: () => showSnackBar(context, 'Lion Pressed!'),
          ),
          AnswerItemModel(
            title: 'Tiger',
            onPressed: () => showSnackBar(context, 'Tiger Pressed!'),
          ),
          AnswerItemModel(
            title: 'Elephant',
            onPressed: () => showSnackBar(context, 'Elephant Pressed!'),
          ),
          AnswerItemModel(
            title: 'Eagle',
            onPressed: () => showSnackBar(context, 'Eagle Pressed!'),
          ),
          AnswerItemModel(
            title: 'Fox',
            onPressed: () => showSnackBar(context, 'Fox Pressed!'),
          ),
          AnswerItemModel(
            title: 'Prey',
            onPressed: () => showSnackBar(context, 'Prey Pressed!'),
          ),
          AnswerItemModel(
            title: 'Wolf',
            onPressed: () => showSnackBar(context, 'Wolf Pressed!'),
          ),
        ],
      ),
    ];

    resultScore = questions.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showTotalScore = myTotalScore >= resultScore;

    return Center(
      child: !showTotalScore
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/palestine.png',
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          widget.toggleThemeMode();
                        },
                        child: Icon(
                          widget.isDarkMode
                              ? Icons.wb_sunny
                              : Icons.nightlight_round,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  QuestionItem(
                    questionItem: questions[questionIndex],
                    isDarkMode: widget.isDarkMode,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 300, // Adjust the height to fit the available space
                    child: ListView.builder(
                      itemCount: questions[questionIndex].availableAnswers.length,
                      itemBuilder: (context, index) {
                        return AnswerItem(
                          answerMap: questions[questionIndex].availableAnswers[index],
                          isAnswerChosen: answerChosen == index,
                          questionIndexChangeCallback: () {
                            setState(() {
                              answerChosen = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (questionIndex + 1 < questions.length) {
                          setState(() {
                            questionIndex += 1;
                          });
                        }
                        setState(() {
                          myTotalScore++;
                        });

                        answerChosen = -1;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            widget.isDarkMode ? Colors.white : Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color:
                              widget.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/palestine.png',
                        height: 30,
                        width: 30,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          widget.toggleThemeMode();
                        },
                        child: Icon(
                          widget.isDarkMode
                              ? Icons.nightlight_round
                              : Icons.wb_sunny,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  const Image(
                    image: AssetImage('lib/assets/R.gif'),
                    height: 50,
                    width: 350,
                  ),
                  const Text(
                    'You have completed the quiz',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'successfully! with total score: $myTotalScore/$resultScore',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          questionIndex = 0;
                          myTotalScore = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Restart Quiz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
/*
To Build a FutureBuilder
widgetFutureBuilder(
  future: Future.delayed(const Duration(seconds: 5)),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return const YourWidget();
    } else {
      return const SizedBox
        .shrink(); // Placeholder widget while waiting
    }
  },
)
*/
