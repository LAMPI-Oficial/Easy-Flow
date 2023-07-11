import 'package:easyflow/layers/data/datasources/get_complaints_datasource.dart';
import 'package:easyflow/layers/domain/entities/complaint_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_complaints_repository.dart';


class GetComplaintsRepositoryImpl
    implements GetComplaintsRepository {
  final GetComplaintsDataSource
      _getComplaintsDataSource;

  GetComplaintsRepositoryImpl(
      this._getComplaintsDataSource);
  @override
  Future<List<ComplaintEntity>> call() async {
    return _getComplaintsDataSource();
  }
}
