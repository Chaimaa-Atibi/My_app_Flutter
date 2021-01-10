import 'package:flutter/material.dart';
import './gallery-data-page.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  String keyWord="";
  TextEditingController editingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery'), backgroundColor: Colors.blueAccent,),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(fontSize: 22),
                onChanged: (value){
                  setState(() {
                    this.keyWord=value;
                  });
                },
                controller: editingController,
                decoration: InputDecoration(hintText: 'Tape a place'),
                onSubmitted: (value){
                  this.keyWord=value;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(this.keyWord)));
                  editingController.text="";
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDataPage(keyWord)));
                editingController.text="";
              },
              color: Colors.deepOrange,
              child: Text('Get Images...', style: TextStyle(fontSize: 22, color: Colors.white),),
            ),
          )),
        ],
      ),
    );
  }
}
