import 'package:flutter_redux_sample/models/search_result.dart';
import 'package:flutter_redux_sample/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, DoSearch>(_doSearchActionReducer),
  TypedReducer<AppState, GotSearchResults>(_gotSearchActionReducer),
  TypedReducer<AppState, SearchFailed>(_searchFailedActionReducer)
]);

AppState _doSearchActionReducer(AppState appState, DoSearch action) {
  return appState.copy(
    searchState: SearchState.LOADING,
    searchResults: SearchResult.empty()
  );
}

AppState _gotSearchActionReducer(AppState appState, GotSearchResults action) {
  return appState.copy(
    searchState: SearchState.SUCCESS,
    searchResults: action.results
  );
}

AppState _searchFailedActionReducer(AppState appState, SearchFailed action) {
  return appState.copy(
      searchState: SearchState.FAILED
  );
}