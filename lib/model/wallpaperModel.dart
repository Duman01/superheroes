class arrayImages {
  String num_;
  String id;
  String cat_id;
  String wallpaper_image;
  String wallpaper_image_thumb;
  String total_views;
  String total_rate;
  String rate_avg;
  String wall_tags;
  String cid;
  String category_name;
  String category_image;
  String category_image_thumb;
  String total_download;

  arrayImages({
    this.num_,this.cat_id,this.id,this.category_image,
    this.category_image_thumb,this.category_name,this.cid,
    this.rate_avg,this.total_rate,this.total_views,
    this.wall_tags,this.wallpaper_image,this.wallpaper_image_thumb,
    this.total_download
    });

  factory arrayImages.fromJson(Map<String, dynamic> json) {
    return arrayImages(
      num_ : json['num_'],
      id : json['id'],
      cat_id : json['cat_id'],
      wallpaper_image : json['wallpaper_image'],
      wallpaper_image_thumb : json['wallpaper_image_thumb'],
      total_views : json['total_views'],
      total_rate : json['total_rate'],
      rate_avg : json['rate_avg'],
      wall_tags : json['wall_tags'],
      cid : json['cid'],
      category_name : json['category_name'],
      category_image : json['category_image'],
      category_image_thumb : json['category_image_thumb'],
      total_download : json['total_download']
    );
  }

}

class wallpaperList{
  final List<arrayImages> listWallpaper;
  wallpaperList({this.listWallpaper});

  factory wallpaperList.fromJson(List<dynamic> json){
    List<arrayImages> listWallpaper = new List<arrayImages>();
    listWallpaper = json.map((i)=>arrayImages.fromJson(i)).toList();
    return wallpaperList(listWallpaper: listWallpaper);
  }
}