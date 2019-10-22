import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "이건 내 앱",
      home: RandomWords(),
    );
  }
}
class RandomWordsState extends State<RandomWords>{
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _bulidSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0), 
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          
          final index = i ~/ 2;
          if (index>= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      body: _bulidSuggestions(),
    );
  }

}
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}