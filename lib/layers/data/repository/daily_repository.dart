
import 'package:easyflow/layers/data/model/daily_model.dart';
import 'package:easyflow/layers/data/provider/daily_provider.dart';


class DailyRepository {
  final DailyProvider provider;

  DailyRepository(this.provider);

  Future<List<DailyModel>> getAll() {
    return provider.getAll();
  }

  Future<DailyModel> getById(int id) {
    return provider.getById(id);
  }

  Future<int> add(DailyModel podel) {
    return provider.add(podel);
  }

  Future<void> edit(DailyModel podel) {
    return provider.edit(podel);
  }

  Future<void> delele(int id) {
    return provider.delete(id);
  }
}
