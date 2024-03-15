class User {
  String name;
  Plan? plan;
  bool hasConnectedToBasicServer = false;

  User({required this.name});

  void subscribe(Plan selectedPlan) {
    plan = selectedPlan;
    print('${name} subscribed to ${selectedPlan.type} Plan.');
  }

  void unsubscribe() {
    plan = null;
    hasConnectedToBasicServer = false;
    print('${name} unsubscribed from the plan.');
  }

  void connectServer(Server server) {
    if (plan is BasicPlan) {
      if (!hasConnectedToBasicServer) {
        hasConnectedToBasicServer = true;
        print('${name} is connecting to ${server.name} (${server.ipAddress})');
      } else {
        print('${name} can only connect to one server with Basic Plan.');
      }
    } else if (plan is ProPlan) {
      print('${name} is connecting to ${server.name} (${server.ipAddress})');
    } else {
      print('${name} does not have an active subscription plan.');
    }
  }
}

class Server {
  String name;
  String ipAddress;

  Server({required this.name, required this.ipAddress});
}

//Plan is abstract, representing different subscription plans
abstract class Plan {
  String get type;
}

//BasicPlan & ProPlan inherit type from Plan
class BasicPlan implements Plan{
  @override
  String type = 'Basic';
}

class ProPlan implements Plan{
  @override
  String type = 'Pro';
}