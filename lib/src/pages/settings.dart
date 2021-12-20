import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/controller/Authcontroller.dart';
import 'package:flutter_application_1/domain/controller/preferencecontroller.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Settings extends StatefulWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  PreferenceController preferencesController = Get.find();
  AuthController authController = Get.find();
  bool _status = false;
  @override
  Widget build(BuildContext context) {
    //bool _status = false;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.orange),
          ),
          // actions: [
          //   GetBuilder<ThemeController>(
          //       init: ThemeController(),
          //       builder: (_) => Obx(
          //             () => Switch(
          //                 value: _.isThemeDark,
          //                 onChanged: (value) => _.changeTheme()),
          //           )),
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    "Mantener sesion iniciada",
                    style: TextStyle(color: Colors.orange),
                  )),
                  Switch(
                      value: (preferencesController.preferences),
                      onChanged: (bool value) {
                        setState(() {
                          _status = value;
                          preferences(_status);
                        });
                      })
                ],
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    //padding: EdgeInsets.all(10),
                    color: Colors.black,
                    textColor: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Go back "),
                        Icon(Icons.arrow_back_rounded)
                      ],
                    ),
                    onPressed: () => {Navigator.pop(context)}),
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }

  preferences(on) {
    preferencesController.newPreference(on);
    preferencesController.save_data2(on);

    print("aqui on");
  }
}
