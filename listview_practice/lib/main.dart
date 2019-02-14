import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'listview_heart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
//  FirebaseAnalytics _analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(

      title: 'Welcom to Flutter',
      home: new ListViewHeart(),
      theme: new ThemeData(
        primaryColor: Colors.red,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  /// Prefixing an identifier with an underscore enforces privacy in the Dart language.
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context,i) {
//      print(context);
//      print('i = $i');
      if (i.isOdd) return Divider(height: 20, color: Colors.blue);
//      if (i.isEven) return Divider(height: 44,color: Colors.red);
      final index = i ~/ 2;
//      print(index);
      // 如果 index  大于当前 suggestions 的数量 那么向 suggestions 添加数据
      if (index >= _suggestions.length) {
        //
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile (
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        /// Notify the framework that the internal state of this object has changed.The provided callback is immediately called synchronously
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          }else {
            _saved.add(pair);
          }

        });
      },
    );

  }

}
