import 'package:easyflow/layers/data/model/horary_model.dart';
import 'package:easyflow/layers/data/model/user_model.dart';
import 'package:easyflow/layers/data/provider/horary_provider.dart';

class HoraryRepository {
  final HoraryProvider horaryProvider;

  HoraryRepository(this.horaryProvider);

  Future<List<HoraryModel>> getAll(UserModel userModel) {
    return horaryProvider.getAll(userModel);
  }

  Future<HoraryModel> getId(int id) {
    return horaryProvider.getId(id);
  }

  Future<int> add(HoraryModel horaryModel) {
    return horaryProvider.add(horaryModel);
  }

  Future<void> edit(HoraryModel horaryModel) {
    return horaryProvider.edit(horaryModel);
  }

  Future<void> del(int id) {
    return horaryProvider.del(id);
  }
}
