import 'package:server_subscription/src/models/user.dart';

class SubscriptionService {
  void subscribeUserToPlan(User user, Plan plan) {
    user.subscribe(plan);
  }

  void unsubscribeUser(User user) {
    user.unsubscribe();
  }

  bool canConnectToServer(User user, Server server) {
    if (user.plan is BasicPlan) {
      return !user.hasConnectedToBasicServer;
    } else {
      return true;
    }
  }
}