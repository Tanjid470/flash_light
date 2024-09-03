import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:touch_light/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {

  LightController lightController = Get.put(LightController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 50,
          color: Colors.red,
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    lightController.isFlashOn.value = !lightController.isFlashOn.value;
                  },
                  child:Obx(() {
                    return Container(
                      alignment:Alignment.center ,
                      decoration:BoxDecoration( 
                        color:lightController.isFlashOn.value ? Colors.green : Colors.green.shade200,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, -1)
                          )
                        ]
                      ),
                      child: const Text("ON"),
                    );
                    }
                  )
                ),
              ),
              
              Expanded(
                child: InkWell(
                  onTap: () {
                    lightController.isFlashOn.value = !lightController.isFlashOn.value;
                  },
                  child:Obx(() {
                    return Container(
                      alignment:Alignment.center ,
                      decoration:BoxDecoration( 
                        color:lightController.isFlashOn.value ? Colors.red.shade200 : Colors.red,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(-2, 1)
                          )
                        ]
                      ),
                      child: const Text("OFF"),
                    );
                    }
                  )
                ),
              ),
            ],
          ),
        
        ),
      ),
    );
  }
}