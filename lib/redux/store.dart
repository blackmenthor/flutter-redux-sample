import 'package:flutter_redux_sample/api/client.dart';
import 'package:flutter_redux_sample/redux/middleware.dart';
import 'package:flutter_redux_sample/redux/reducer.dart';
import 'package:redux/redux.dart';
import 'app_state.dart';

final store = Store<AppState>(
    reducer,
    initialState: AppState.create(),
    middleware: getMiddlewares(ApiClient())
);