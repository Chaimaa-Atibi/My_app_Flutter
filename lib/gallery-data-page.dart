import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDataPage extends StatefulWidget {
  String keyWord = "";
  GalleryDataPage(this.keyWord);

  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1;
  int size = 10;
  int totalPages;
  ScrollController _scrollController=new ScrollController();
  List<dynamic> hits = [];
  var galleryData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.getData();
        }
      }
    });
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery for ${widget.keyWord}, Page ${currentPage}/${totalPages}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: (galleryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: (galleryData == null ? 0 : hits.length),
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                hits[index]['tags'],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Card(
                          child: Image.network(hits[index]['webformatURL'],fit: BoxFit.fitWidth,),
                        ),
                      ),
                    )
                  ],
                );
              })),
    );
  }

  void getData() {
    String url =
        "https://pixabay.com/api/?key=15770188-48341bba4fe0c21a5913b05b6&q=${widget.keyWord}&page=${currentPage}&per-page=${size}";
    http.get(url).then((resp) {
      setState(() {
        galleryData = json.decode(resp.body);
        hits.addAll(galleryData['hits']);
        if(galleryData['totalHits']%size==0){
          totalPages=galleryData['totalHits']~/size;
        }else{
          totalPages=1+(galleryData['totalHits']/size).floor();
        }
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
