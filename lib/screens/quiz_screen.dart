import 'package:flutter/material.dart';

import '../model/question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = Question.getQuestions();

  bool isSubmitted = false;

  void submitAnswers() {
    setState(() {
      isSubmitted = true;
    });
  }

  void resetAnswers() {
    setState(() {
      isSubmitted = false;
      for (var question in questions) {
        question.selectedAnswerIndex = -1;
        question.isAnswered = false;
      }
    });
  }

  bool allQuestionsAnswered() {
    for (var question in questions) {
      if (!question.isAnswered) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: const Text('Simulado de Mobile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Responda as questões abaixo:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final isCorrect = question.selectedAnswerIndex ==
                      question.correctAnswerIndex;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children:
                                question.options.asMap().entries.map((entry) {
                              final optionIndex = entry.key;
                              final option = entry.value;
                              final isSelected =
                                  question.selectedAnswerIndex == optionIndex;
                              final isAnswered = question.isAnswered;

                              Color? tileColor;
                              if (isSubmitted && isAnswered) {
                                if (isSelected && isCorrect) {
                                  tileColor = Colors.green;
                                } else if (isSelected && !isCorrect) {
                                  tileColor = Colors.red;
                                } else {
                                  tileColor = Colors.white;
                                }
                              }

                              return ListTile(
                                title: Text(option),
                                leading: Radio<int>(
                                  value: optionIndex,
                                  groupValue: question.selectedAnswerIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      question.selectedAnswerIndex = value!;
                                      question.isAnswered = true;
                                    });
                                  },
                                ),
                                tileColor: tileColor,
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      question.selectedAnswerIndex = -1;
                                      question.isAnswered = false;
                                    } else {
                                      question.selectedAnswerIndex =
                                          optionIndex;
                                      question.isAnswered = true;
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 2),
            if (!isSubmitted)
              ElevatedButton(
                onPressed: allQuestionsAnswered() ? submitAnswers : null,
                child: const Text('Enviar'),
              ),
            if (isSubmitted)
              ElevatedButton(
                onPressed: resetAnswers,
                child: const Text('Refazer'),
              ),
          ],
        ),
      ),
    );
  }
}
