import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sample/models/search_result.dart';
import 'package:flutter_redux_sample/redux/app_state.dart';
import 'package:flutter_redux_sample/redux/store.dart';
import 'package:flutter_redux_sample/ui/search_result_widget.dart';
import 'package:redux/redux.dart';
import 'redux/actions.dart';
import 'utils/constants.dart';

void main() {
  return runApp(DictionaryApp(store: store));
}

class DictionaryApp extends StatelessWidget {
  final Store<AppState> store;

  DictionaryApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: Constants.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: Constants.APP_NAME),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState();

  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 4.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for Books...',
              ),
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: "Hind",
                decoration: TextDecoration.none,
              ),
              onChanged: (string) {
                setState(() {
                  this.currentText = string;
                });
              },
            ),
          ),
          StoreConnector<AppState,_SearchScreenViewModel>(
            converter: (store) {
              return _SearchScreenViewModel(
                state: store.state.searchState
              );
            },
            builder: (context, viewModel) => RaisedButton(
              onPressed: () {
                store.dispatch(DoSearch(currentText));
              },
              child: Text(
                "SEARCH"
              ),
            ),
          ),
          StoreConnector<AppState, _SearchScreenViewModel>(
            converter: (store) {
              return _SearchScreenViewModel(
                  state: store.state.searchState,
              );
            },
            builder: (context, viewModel) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("STATUS :"),
                  Text(viewModel.state.toString())
                ],
              );
            },
          ),
          StoreConnector<AppState, _SearchScreenViewModel>(
            converter: (store) {
              return _SearchScreenViewModel(
                state: store.state.searchState,
                results: store.state.searchResults
              );
            },
            builder: (context, viewModel) {
              return Expanded(
                child: viewModel.state != SearchState.SUCCESS ? Text("EMPTY LIST")
                    : ListView.builder(
                    itemCount: viewModel.results.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SearchResultWidget(document: viewModel.results.docs[index]);
                    }
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _SearchScreenViewModel {
  final SearchState state;
  final SearchResult results;

  _SearchScreenViewModel({this.state, this.results});
}