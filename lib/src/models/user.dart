import 'package:server_subscription/src/models/plan.dart';
import 'package:server_subscription/src/models/server.dart';

class User {
  String? name;
  Plan? plan;
  bool hasConnectedToBasicServer = false;

  void subscribe(Plan selectedPlan) {
    plan = selectedPlan;
    print('$name subscribed to $selectedPlan Plan.');
  }

  void unsubscribe() {
    plan = null;
    hasConnectedToBasicServer = false;
    print('$name unsubscribed from the plan.');
  }

  void connectServer(Server server) {
    if (plan is BasicPlan) {
      if (!hasConnectedToBasicServer) {
        hasConnectedToBasicServer = true;
        print('$name is connecting to ${server.name} (${server.ipAddress})');
      } else {
        print('$name can only connect to one server with Basic Plan.');
      }
    } else if (plan is ProPlan) {
      print('$name is connecting to ${server.name} (${server.ipAddress})');
    } else {
      print('$name does not have an active subscription plan.');
    }
  }
}

