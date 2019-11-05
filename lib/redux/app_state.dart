import 'package:flutter_redux_sample/models/search_result.dart';

class AppState {

  final SearchResult searchResults;
  final SearchState searchState;

  AppState({this.searchResults, this.searchState = SearchState.IDLE});

  factory AppState.create() => AppState();

  AppState copy({
    SearchResult searchResults,
    SearchState searchState
  }) => AppState(
      searchResults: searchResults ?? this.searchResults,
      searchState: searchState ?? this.searchState
  );

}

enum SearchState {
  IDLE,
  LOADING,
  SUCCESS,
  FAILED
}