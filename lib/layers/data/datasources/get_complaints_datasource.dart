import 'package:easyflow/layers/domain/entities/complaint_entity.dart';

abstract class GetComplaintsDataSource {
  Future<List<ComplaintEntity>> call();
}
