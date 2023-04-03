
import 'package:easyflow/layers/data/provider/horary_provider.dart';

class HoraryRepository {

final HoraryProvider horaryProvider;

HoraryRepository(this.horaryProvider);

getAll(){
  return horaryProvider.getAll();
}
getId(id){
  return horaryProvider.getId(id);
}
delete(id){
  return horaryProvider.delete(id);
}
edit(obj){
  return horaryProvider.edit( obj );
}
add(obj){
    return horaryProvider.add( obj );
}

}