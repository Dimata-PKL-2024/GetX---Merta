import 'package:get/get.dart';
import '../models/rental_motor.dart';

class MotorController extends GetxController {
  var motorList = <RentalMotor>[
    RentalMotor(
      name: 'Honda Vario',
      description: 'Motor matic irit dan nyaman untuk perjalanan jauh.',
      rentalPrice: 'Rp 75,000/hari',
      imageAsset: 'assets/images/vario.png',
    ),
    RentalMotor(
      name: 'Yamaha NMAX',
      description: 'Motor matic besar dengan kenyamanan tinggi.',
      rentalPrice: 'Rp 90,000/hari',
      imageAsset: 'assets/images/nmax-hijau.png',
    ),
    RentalMotor(
      name: 'Honda CB150 R STD',
      description: 'Honda CB150R memiliki desain yang pas untuk ukuran orang Asia sehingga nyaman dikendarai dalam jarak jauh.',
      rentalPrice: 'Rp 80,000/hari',
      imageAsset: 'assets/images/hondaCB.png',
    ),
    RentalMotor(
      name: 'Honda Beat',
      description: 'Honda Beat menggunakan teknologi enhanced smart power (eSP) yang diklaim dapat mengurangi konsumsi bahan bakar.',
      rentalPrice: 'Rp 60,000/hari',
      imageAsset: 'assets/images/beat.png',
    ),
    RentalMotor(
      name: 'Yamaha Fazzio',
      description: 'Motor Fazzio hadir dangan fitur-fitur yang terbilang canggih. Beberapa fitur tersebut yaitu didukung dengan full digital speedometer, Y connect, smart key system, electric power socket, dan one push start.',
      rentalPrice: 'Rp 75,000/hari',
      imageAsset: 'assets/images/Fazzio-Neo.png',
    ),
  ].obs;

  // Daftar yang difilter berdasarkan pencarian
  var filteredMotorList = <RentalMotor>[].obs;

  // Query pencarian
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredMotorList.assignAll(motorList);
  }

  void filterMotorList(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredMotorList.assignAll(motorList); 
    } else {
      filteredMotorList.assignAll(
        motorList.where((motor) => motor.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
