import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Center(
          child: RandonEnglishWords(),
        )
      ),
    );
  }
}

class RandonEnglishWords extends StatefulWidget {
  RandonEnglishWords({Key key, this.title}) : super(key: key);
  final String title;
  @override
  RandonEnglishWordsState createState() => RandonEnglishWordsState();
}

class RandonEnglishWordsState extends State<RandonEnglishWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(fontSize: 40),
    );
  }
}
