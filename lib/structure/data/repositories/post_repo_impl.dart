import 'package:rapexa_academy/structure/data/datasources/remote/post_db_remote.dart';
import 'package:rapexa_academy/structure/domain/repositories/post_repo.dart';

import '../../../infrastructure/network/base/base_rp.dart';
import '../datasources/local/shared_store.dart';

class PostRepositoryImpl implements PostRepository{

  PostDBRemote remoteDb;
  PostRepositoryImpl(this.remoteDb);

  @override
  void getPosts(Function(BaseRp) onData) {
    BaseRp baseRp;
    if(SharedStore.getPosts() != null){
      baseRp = SharedStore.getPosts()!;
      onData.call(baseRp);
    }
    remoteDb.fetchPosts().then((value){
      SharedStore.setPosts(value);
      onData.call(value);
    });
  }

  // @override
  // Future<String> getTeacher() {
  //   remoteDb.getTeacher();
  // }


}