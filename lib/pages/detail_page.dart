import 'package:flutter/material.dart';
import '../models/rental_motor.dart';

class DetailPage extends StatelessWidget {
  final RentalMotor motor;

  DetailPage({required this.motor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          motor.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(imageAsset: motor.imageAsset),
              SizedBox(height: 16),
              NameWidget(name: motor.name),
              SizedBox(height: 8),
              DescriptionWidget(description: motor.description),
              SizedBox(height: 16),
              RentalPriceWidget(rentalPrice: motor.rentalPrice),
              SizedBox(height: 20),
              RentButtonWidget(motor: motor),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget untuk gambar motor
class ImageWidget extends StatelessWidget {
  final String imageAsset;

  ImageWidget({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageAsset,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Widget untuk nama motor
class NameWidget extends StatelessWidget {
  final String name;

  NameWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.teal[800],
      ),
    );
  }
}

// Widget untuk deskripsi motor
class DescriptionWidget extends StatelessWidget {
  final String description;

  DescriptionWidget({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[700],
        height: 1.5,
      ),
    );
  }
}

// Widget untuk harga sewa
class RentalPriceWidget extends StatelessWidget {
  final String rentalPrice;

  RentalPriceWidget({required this.rentalPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Icon(
              Icons.attach_money,
              color: Colors.teal[700],
              size: 30,
            ),
            SizedBox(width: 8),
            Text(
              'Harga Sewa: $rentalPrice',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk tombol sewa
class RentButtonWidget extends StatelessWidget {
  final RentalMotor motor;

  RentButtonWidget({required this.motor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Aksi pemesanan
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Konfirmasi Sewa'),
              content: Text(
                  'Apakah Anda ingin menyewa ${motor.name} seharga ${motor.rentalPrice}?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Sewa berhasil!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Sewa'),
                ),
              ],
            ),
          );
        },
        icon: Icon(Icons.directions_bike),
        label: Text(
          'Sewa Sekarang',
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 147, 148, 148),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
