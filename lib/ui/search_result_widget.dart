import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_sample/models/document.dart';

class SearchResultWidget extends StatelessWidget {

  final Key key;
  final Document document;

  SearchResultWidget({this.key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            document.getBookCover() == null ? Container() : Container(
              width: 128.0,
              height: 128.0,
              margin: EdgeInsets.only(right: 16.0),
              child: CachedNetworkImage(
                imageUrl: document.getBookCover(),
                placeholder: (context, string) => CircularProgressIndicator(),
                fit: BoxFit.fitWidth,
                errorWidget: (context, _, error) => Icon(Icons.error, color: Colors.black,),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  rowItem(context, "Book Title", document.title),
                  rowItem(context, "Book Author", document.authorName?.first),
                  rowItem(context, "First Publish Year", document.firstPublishYear.toString()),
                  rowItem(context, "Publisher", document.publisher?.first),
                  rowItem(context, "Language", document.language?.first),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowItem(BuildContext context, String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
        Expanded(
          child: Text(
            content ?? "-",
            overflow: TextOverflow.clip,
          ),
        )
      ],
    );
  }

}