import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {


  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;
  final quiz = [
    {
      'title': 'Q1 - Which Map class should be most popular in a multi-threading environment, considering performance constraint?',
      'answers': [
        {'answer': 'A - Hashtable', 'correct': false},
        {'answer': 'B - CopyOnWriteMap', 'correct': true},
        {'answer': 'C - ConcurrentHashMap', 'correct': false},
        {'answer': 'D - ConcurrentMap', 'correct': false},
      ]
    },
    {
      'title': 'Q2 - The Comparator interface contains the method?',
      'answers': [
        {'answer': 'A - compareWith', 'correct': false},
        {'answer': 'B - compareTo()', 'correct': false},
        {'answer': 'C - compare()', 'correct': true},
      ]
    },
    {
      'title': 'Q3 - Which of these helps insert elements at a specific position in a collection?',
      'answers': [
        {'answer': 'A - ArrayList', 'correct': false},
        {'answer': 'B - LinkedList', 'correct': true},
        {'answer': 'C - Any', 'correct': false},
      ]
    },
    {
      'title': 'Q4 - Complexity of ArrayList get method',
      'answers': [
        {'answer': 'A - O(n-1)', 'correct': false},
        {'answer': 'B - O(n)', 'correct': false},
        {'answer': 'C - O(1)', 'correct': true},
        {'answer': 'D - O(2n)', 'correct': false},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        backgroundColor: Colors.blueAccent,
      ),
      body: (this.currentQuestion >= quiz.length)
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('Score : ${(score / quiz.length * 100).round()}%',
                      style: TextStyle(
                          color: Colors.blue, fontSize: 22)),
                  RaisedButton(
                      color: Colors.blueGrey,
                      onPressed: () {
                        setState(() {
                          currentQuestion = 0;
                          score = 0;
                        });
                      },
                      child: Text(
                        'Restart ...',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ))
                ]))
          : ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                      child: Text(
                          'Question : ${currentQuestion + 1}/${quiz.length}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent))),
                ),
                ListTile(
                  title: Text(
                    '${quiz[currentQuestion]['title']} ?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                ...(quiz[currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        setState(() {
                          if (answer['correct'] == true) ++score;
                          ++this.currentQuestion;
                        });
                      },
                      child: Container(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              answer['answer'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            )),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
