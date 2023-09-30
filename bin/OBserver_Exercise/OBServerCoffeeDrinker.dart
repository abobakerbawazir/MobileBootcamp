//class OBServer
abstract class OBServerCoffeeDrinker {
  late String name;
  late String message;
  OBServerCoffeeDrinker({required this.message, required this.name});

  notify({required DateTime timestamp});
}