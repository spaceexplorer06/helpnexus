import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //final locationController locationController =
  //Get.put<LocationController>(LocationController());
  @override
  void initState() {
    //LocationService.instance.getUserLocation(controller: locationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Home')),
      ),
      //     body: const Center(
      //       child: Obx(()(
      //       return locationController.isAccessingLocation.value? Column(
      //         children: [
      //           CircularProgressIndicator(),
      //           Text('Accessing Location'),],
      //       ):locationController.errorDescription.value.isNotEmpty || locationController.userLocation.value == null?Column(children: [Text(locationController.errorDescription.value)],
      //       )
      //     ),
      //     )));
      // }
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('/assets/images/Home.jpg'),
                  fit: BoxFit.fill),
            ),
          )
        ],
      ),
    );
  }
}
