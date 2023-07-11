import 'package:easyflow/layers/domain/entities/complaint_entity.dart';

abstract class GetComplaintsRepository {
  Future<List<ComplaintEntity>> call();
}
