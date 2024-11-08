import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/motor_controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final MotorController motorController = Get.put(MotorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rental Motor',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            // TextField untuk Pencarian
            TextField(
              onChanged: motorController.filterMotorList,
              decoration: InputDecoration(
                labelText: 'Cari Motor',
                hintText: 'Masukkan nama motor',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),
            // List Motor
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: motorController.filteredMotorList.length,
                    itemBuilder: (context, index) {
                      final motor = motorController.filteredMotorList[index];
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () => Get.to(DetailPage(motor: motor)),
                          borderRadius: BorderRadius.circular(15),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Row(
                                children: [
                                  // Gambar motor dengan ukuran fleksibel menggunakan AspectRatio
                                  Flexible(
                                    flex: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      child: AspectRatio(
                                        aspectRatio: 1, // Menjaga aspek rasio gambar
                                        child: Image.asset(
                                          motor.imageAsset,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  // Info motor
                                  Flexible(
                                    flex: 3,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            motor.name,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal[800],
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            motor.rentalPrice,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.teal[600],
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Klik untuk melihat detail',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(width: 10),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
