import 'package:lanaedu/models/AppModel.dart';
import 'package:lanaedu/redux/modules/authentication/reducer.dart';

AppState appReducer(AppState state, action) {
  //print(action);
  return new AppState(
    auth: authReducer(state.auth, action),
  );
}
