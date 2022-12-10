import 'package:get/get.dart';

class profile_controller extends GetxController {
  List<String> allergen = [];
  List<String> disease = [];
  RxList selectedAllergens = [].obs;
  RxList selectedDiseases = [].obs;
}
