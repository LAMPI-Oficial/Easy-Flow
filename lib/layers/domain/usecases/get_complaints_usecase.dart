import 'package:easyflow/layers/domain/entities/complaint_entity.dart';
import 'package:easyflow/layers/domain/repositories/get_complaints_repository.dart';


abstract class GetComplaintsUseCase {
  Future<List<ComplaintEntity>> call();
}

class GetComplaintsUseCaseImpl
    implements GetComplaintsUseCase {
  final GetComplaintsRepository
      _getComplaintsRepository;

  GetComplaintsUseCaseImpl(
      this._getComplaintsRepository);

  @override
  Future<List<ComplaintEntity>> call() async {
    return _getComplaintsRepository();
  }
}
