import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Demo'),
        ),
        // 画面の小さいデバイスでも表示可能なよう、Column でなく ListView を用いてスクロールできるように
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection(),
            buttonSection(Theme.of(context).primaryColor),
            textSection(),
          ],
        ),
      )
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          // Expanded ウィジェット内に Column を置くことで、余りの領域すべてを使うことが出来る
          Expanded(child: Column(
            // 左側基準で始まることを宣言
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // padding を置きたいため Text 直接でなく、Container の内部に Text を置く作りにしている
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // サブの文字列。グレーにしてある
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          FavoriteWidget(),
        ],
      ),
    );
  }

  Widget buttonSection(Color color) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        // SizedBox ( https://api.flutter.dev/flutter/widgets/SizedBox-class.html ) を使用し横幅を規定することで、
        // スターの位置が移動してしまう現象を防ぐ
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    // setState が超大事！ これがないと見た目が変化しない
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }

      _isFavorited = !_isFavorited;
    });
  }
}
