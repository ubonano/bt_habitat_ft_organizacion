import 'package:flutter/material.dart';

class DetailPanelPage extends StatefulWidget {

  final String sectionName;

  const DetailPanelPage({Key key, this.sectionName}) : super(key: key);

  @override
  _DetailPanelPageState createState() => _DetailPanelPageState();
}

class _DetailPanelPageState extends State<DetailPanelPage> with TickerProviderStateMixin {

  bool collapse = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                Text(
                  widget.sectionName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: Icon(
                    collapse
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () => {
                    setState(() {
                      collapse = !collapse;
                    })
                  },
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInCubic,
            vsync: this,
            child: Container(
              constraints: collapse
                  ? BoxConstraints(maxHeight: 0.0)
                  : BoxConstraints(maxHeight: double.infinity),
              color: Colors.blueGrey,
              child: Column(children: [
                _buildClassPanel('Clase 1'),
                _buildClassPanel('Clase 2'),
                _buildClassPanel('Clase 3'),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassPanel(String className) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 50,
            color: Color(0xFF66A76C),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                Text(
                  className,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          Container(
            color: Color(0xFF66A76C),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildContentClasses(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContentClasses() {
    List<Widget> list = [];
    list.add(Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Text(
            'Videos',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'https://www.youtube.com/watch?v=5x6P5Ld9ufw',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    ));

    return list;
  }
}
