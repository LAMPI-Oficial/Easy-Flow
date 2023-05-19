import 'package:easyflow/layers/data/provider/complaint_provider.dart';
import 'package:easyflow/layers/modules/complaint/pages/complaints_page.dart';

class ComplaintRepository {
  final ComplaintProvider _complaintProvider;

  ComplaintRepository(this._complaintProvider);

  void addComplaint(
      {required String name,
      required String email,
      required String description}) async {
    await _complaintProvider.addComplaint(
        name: name, email: email, description: description);
  }
}
