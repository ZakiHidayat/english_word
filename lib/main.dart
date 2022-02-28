import "package:english_words/english_words.dart" show WordPair, generateWordPairs;
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';  // Add this line.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'RecyclerView',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> listbahasa = <WordPair>[];
  final TextStyle _biggerfont = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    // final WordPair wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);

    return Scaffold(
      appBar: AppBar(
        title: Text("English Words"),
      ),
      body: _buildSugesti(),
    );
  }
  Widget _buildSugesti() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext contextuild, int i) {

          if (i.isOdd){
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= listbahasa.length){
            listbahasa.addAll(generateWordPairs().take(10));
          }
          return buildRow(listbahasa[index]);
        }
    );
  }
  Widget buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerfont,
      ),
    );
  }
}