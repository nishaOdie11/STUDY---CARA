import 'package:server_subscription/src/models/user.dart';
import 'package:server_subscription/src/services/subscription_service.dart';

void main() {
  User user = User(name: 'Nisha');
  // user.name = 'Haziq Zahari';

  Server server1 = Server(name: 'Server 1', ipAddress: '192.168.0.1');
  // server1.name = 'Server 1';
  // server1.ipAddress = '192.168.0.1';

  Server server2 = Server(name: 'Server 2', ipAddress: '192.168.0.2');
  // server2.name = 'Server 2';
  // server2.ipAddress = '192.168.0.2';

  SubscriptionService subscriptionService = SubscriptionService();
  
  /*
 * Flow 1 - Basic Plan
 */

  print("Flow #1 Basic Plan Subscription !\n\n");

  subscriptionService.subscribeUserToPlan(user, BasicPlan());

  user.connectServer(server2);
  user.connectServer(server1); // fail

  /*
 * Flow 2 - Pro Plan
 */

  print("Flow #2 Pro Plan Subscription !\n\n");

  user.subscribe(ProPlan());

  user.connectServer(server1);
  user.connectServer(server2); // success

  /*
 * Flow 3 - Unsubscribe
 */

  print("Flow #3 Unsubscribe Plan Subscription !\n\n");

  user.unsubscribe();
  user.connectServer(server2); // fail
}
