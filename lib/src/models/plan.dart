//Plan is abstract, representing different subscription plans
abstract class Plan {
  // String get type;
}

//BasicPlan & ProPlan inherit type from Plan
class BasicPlan implements Plan{
  // @override
  // String type = 'Basic';
}

class ProPlan implements Plan{
  // @override
  // String type = 'Pro';
}