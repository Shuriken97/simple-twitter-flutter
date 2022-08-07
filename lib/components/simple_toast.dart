import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SimpleToast {
  static void _showToast({Color? backgroundColor, required String label}) {
    final FToast fToast = FToast();
    fToast.init(Get.overlayContext!);
    final Widget toast = Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: backgroundColor,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 15,
          )
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }

  static void toastInfo({required String label}) {
    _showToast(label: label, backgroundColor: Colors.black);
  }

  static void toastCritical({required String label}) {
    _showToast(label: label, backgroundColor: Colors.red);
  }
}
