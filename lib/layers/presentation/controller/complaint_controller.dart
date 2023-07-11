import 'package:easyflow/layers/domain/entities/complaint_entity.dart';
import 'package:flutter/material.dart';

class ComplaintController {

  ComplaintController();

  final formKey = GlobalKey<FormState>();
  final descriptionTextController = TextEditingController();

  Future<List<ComplaintEntity>> getComplaints() async {
    return [ComplaintEntity(description: 'saojfoiAJIFOJDIJFIOASJ',id: 1, date: DateTime.now())];
  }
}
