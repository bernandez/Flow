import 'package:flow/models/flow_user_model.dart';
import 'package:flutter/cupertino.dart';

import '../services/auth_service.dart';

class FlowUserData extends ChangeNotifier {
  FlowUser flowUser = FlowUser(
    firstName: FirebaseAuthService().getCurrentUser()?.displayName,
    uid: FirebaseAuthService().getCurrentUser()?.uid,
    email: FirebaseAuthService().getCurrentUser()?.email,
  );

}
