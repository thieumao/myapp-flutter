import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      home: RandonEnglishWords(),
    );
  }
}

class RandonEnglishWords extends StatefulWidget {
  RandonEnglishWords({Key key}) : super(key: key);
  @override
  RandonEnglishWordsState createState() => RandonEnglishWordsState();
}

class RandonEnglishWordsState extends State<RandonEnglishWords> {
  final words = <WordPair>[];
  final checkedWords = Set<WordPair>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (index >= words.length) {
          words.addAll(generateWordPairs().take(10));
        }
        return buildRow(index, words[index]);
      }),
    );
  }

  Widget buildRow(int index, WordPair wordPair) {
    final blueColor = Colors.blue;
    final redColor = Colors.red;
    final color = (index % 2 == 0) ? blueColor : redColor;
    final isChecked = checkedWords.contains(wordPair);
    return ListTile(
      leading: Icon(
          isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          color: color,
      ),
      title: Text(
        index.toString() + " " + wordPair.asPascalCase,
        style: TextStyle(fontSize:  18, color: color),
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            checkedWords.remove(wordPair);
          } else {
            checkedWords.add(wordPair);
          }
        });
      },
    );
  }
}
