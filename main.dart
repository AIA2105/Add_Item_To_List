import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: AddRemoveListView(),
));




class AddRemoveListView extends StatefulWidget {

  _AddRemoveListViewState createState() => _AddRemoveListViewState();
}

class _AddRemoveListViewState extends State<AddRemoveListView> {
  TextEditingController _textController = new TextEditingController();
  TextEditingController _textController1 = new TextEditingController();

  List<String> _listViewData = [
    "Ahmed",
    "Ali",
    "Osama",
  ];
  List<String> _listViewData1 = [
    "0123456789",
    "5201452",
    "0011224785",
  ];

  _onSubmit() {
    setState(() {
      _listViewData.add(_textController.text);
      _listViewData1.add(_textController1.text);

      _textController.clear();
      _textController1.clear();


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add & Remove from ListView'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'enter name',
                  ),
                ),
                TextField(
                  keyboardType:TextInputType.phone ,
                  controller: _textController1,
                  decoration: InputDecoration(
                    hintText: 'enter number',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: RaisedButton(
              onPressed: _onSubmit,
              child: Text('Add to List'),
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child:  ListView.builder(
                  itemCount: _listViewData.length,
                 itemBuilder: (context, index) {
                  return new Card(child:
                      new ListTile(title: Text('Name : ${_listViewData[index]}'),
                        subtitle: Text('Number : ${_listViewData1[index]}',),
                  )
                    );


                  }
                  )

          ),
        ],
      ),
    );
  }
}