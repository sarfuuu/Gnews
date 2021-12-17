import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsDetail extends StatefulWidget {
  final newsDetailData;
  const NewsDetail({Key? key, this.newsDetailData}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  final format = DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'en-US');
  final regex = RegExp('(?= )');
  final query = "Alice";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.network(widget.newsDetailData['image']),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  widget.newsDetailData['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.015),
              ),
              Text(
                "Author: " + widget.newsDetailData['source']['name'],
              ),
              Text(
                DateFormat().format(
                    DateTime.parse(widget.newsDetailData['publishedAt'])),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  widget.newsDetailData['description'],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  widget.newsDetailData['content'],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
