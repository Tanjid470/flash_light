import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';
import 'package:touch_light/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {

  LightController lightController = Get.put(LightController());
  late bool isTorchAvailable;

  @override
  void initState() {
    super.initState();
    checkTorchAvailability();
  }

  void checkTorchAvailability() async {
    isTorchAvailable = await deviceTouchLightCheck();
    setState(() {});
  }

  Future<bool> deviceTouchLightCheck() async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      log('isTorchAvailable: false');
      return false;
    }
  }



  Future<bool> lightOf() async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (_) {
      log('isTorchAvailable: false');
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 100,
          color: Colors.red,
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    lightController.isFlashOn.value = true;
                      log(isTorchAvailable.toString());
                    try {
                      await TorchLight.enableTorch();
                    } on Exception catch (e) {
                     log(e.toString());
                    }

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
                  onTap: () async {
                    lightController.isFlashOn.value = false;
                    try {
                      await TorchLight.disableTorch();
                    } on Exception catch (e) {
                      log(e.toString());
                    }
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