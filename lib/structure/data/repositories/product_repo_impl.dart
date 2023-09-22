import 'package:get/get.dart';
import 'package:rapexa_academy/structure/data/datasources/local/shared_store.dart';
import 'package:rapexa_academy/structure/data/datasources/remote/product_db_remote.dart';
import 'package:rapexa_academy/structure/data/models/response/get_products_rp.dart';

import '../../../infrastructure/network/base/base_rp.dart';
import '../../domain/repositories/product_repo.dart';

class ProductRepositoryImpl implements ProductRepository{

  ProductDBRemote remoteDb;
  ProductRepositoryImpl(this.remoteDb);

  @override
  void getProducts(Function(BaseRp) onData) {
    BaseRp changeRp(BaseRp rp){
      if(rp is GetProductsRp) {
        //change price str
        for (int i = 0; i < rp.list!.length; i++) {
          if (rp.list![i].regularPrice?.toString() != "0" &&
              rp.list![i].regularPrice?.toString() !=
                  rp.list![i].price?.toString()) {
            rp.list![i].isDiscount = true;
            rp.list![i].percentDiscount = "%${(100 /
                (int.parse(rp.list![i].regularPrice.toString()) /
                    int.parse(rp.list![i].price.toString())))
                .toInt()
                .toString()}";
            rp.list![i].productPriceStr = "\$ ${rp.list![i].price!}";
          } else if (rp.list![i].price?.toString() == "0") {
            rp.list![i].isFree = true;
            rp.list![i].productPriceStr = "رایگان";
          } else {
            rp.list![i].productPriceStr = "\$ ${rp.list![i].price!}";
          }
          if(rp.list![i].isFree){
            //https://t.me/rapexa
            rp.list![i].freeVideos = [];
            try{
              String videoContent = rp.list![i].description!.split("سوالات خود را میتوانید از طریق")[1];
              rp.list![i].description = rp.list![i].description!.split("سوالات خود را میتوانید از طریق")[0];
              List<String> videosContent = videoContent.split("جلسه");
              for(String video in videosContent){
                if(!video.contains("mp4"))
                  continue;
                FreeVideo freeVideo = FreeVideo("", "");
                String title = "جلسه"+video.split("ویدئو")[0];
                String videoLink = video.split("ویدئو")[1].split("<a href=\"")[1].split("mp4")[0]+"mp4";
                freeVideo.title = title.trim();
                freeVideo.link = videoLink;
                rp.list![i].freeVideos!.add(freeVideo);
              }
            }catch(e){
              e.printError();
            }
          }
        }

        return rp;
      }
      return rp;
    }
    BaseRp baseRp;
    if(SharedStore.getProducts() != null){
      baseRp = SharedStore.getProducts()!;
      onData.call(changeRp(baseRp));
    }
    remoteDb.fetchProduct().then((value){
      SharedStore.setProducts(value);
      onData.call(changeRp(value));
    });
  }

  // @override
  // Future<String> getTeacher() {
  //   remoteDb.getTeacher();
  // }


}