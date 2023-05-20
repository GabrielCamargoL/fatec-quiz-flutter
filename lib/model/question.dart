class Question {
  final String title;
  final List<String> options;
  final int correctAnswerIndex;
  int selectedAnswerIndex;
  bool isAnswered;

  Question({
    required this.title,
    required this.options,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
    required this.isAnswered,
  });

  static getQuestions() {
    return [
      Question(
        title:
            '1. Qual é o framework utilizado para desenvolvimento de aplicativos móveis multiplataforma com o uso da linguagem Dart?',
        options: ['React Native', 'Flutter', 'Xamarin'],
        correctAnswerIndex: 1,
        selectedAnswerIndex: -1,
        isAnswered: false,
      ),
      Question(
        title:
            '2. Qual é a linguagem de programação utilizada para desenvolver aplicativos iOS?',
        options: ['Java', 'Kotlin', 'Swift'],
        correctAnswerIndex: 2,
        selectedAnswerIndex: -1,
        isAnswered: false,
      ),
      Question(
        title:
            '3. Qual é o sistema operacional mais utilizado em smartphones no mundo?',
        options: ['Android', 'iOS', 'Windows Phone'],
        correctAnswerIndex: 0,
        selectedAnswerIndex: -1,
        isAnswered: false,
      ),
      Question(
        title:
            '4. O que é o APK no contexto do desenvolvimento de aplicativos Android?',
        options: [
          'O arquivo de instalação de um aplicativo Android',
          'Uma Linguagem de programação utilizada para desenvolver aplicativos Android',
          'O ambiente de desenvolvimento utilizado para criar aplicativos Android'
        ],
        correctAnswerIndex: 0,
        selectedAnswerIndex: -1,
        isAnswered: false,
      ),
    ];
  }
}
