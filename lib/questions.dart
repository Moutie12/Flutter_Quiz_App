class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

 List<Question> sample_data = [
  Question(
      id: 1,
      question: "What programming language is primarily used for building apps with Flutter?",
      options: ['Java', 'Dart', 'Python', 'Microsoft'],
      answer: 3,
  ),

   Question(
     id: 2,
     question: "What widget in Flutter is used to add a scrollable list of children?",
     options: ['ListView', 'Column', 'Container', 'May 2018'],
     answer: 1,
   ),

   Question(
     id: 3,
     question: "In Flutter, how can you add padding around a widget?",
     options: ['margin', 'space', 'padding', 'Word'],
     answer: 3,
   ),

   Question(
     id: 4,
     question: "How can you define a constant variable in Dart?",
     options: ['final', 'constant', 'var', 'Output>>'],
     answer: 1,
   ),

];