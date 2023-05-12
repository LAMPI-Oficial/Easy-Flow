import 'package:easyflow/layers/data/model/create_adress_request_model.dart';
import 'package:easyflow/layers/data/provider/adress_provider.dart';

class AdressRepository {
  final AdressProvider _adressProvider;

  AdressRepository(this._adressProvider);

  Future<String> save(CreateAdressRequestModel createAdressRequestModel) {
    return _adressProvider.save(createAdressRequestModel);
  }
}
