import 'package:easyflow/layers/data/model/complaint_model.dart';
import 'package:flutter/material.dart';

class ComplaintController {
  ComplaintController();

  final formKey = GlobalKey<FormState>();
  final descriptionTextController = TextEditingController();

  Future<List<ComplaintModel>> getComplaints() async {
    return [ComplaintModel(description: 'saojfoiAJIFOJDIJFIOASJ', date: DateTime.now())];
  }
}
