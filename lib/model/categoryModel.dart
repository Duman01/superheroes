class arrayImagesCategory{
  String cid;
  String category_name;
  String category_image;
  String category_image_thumb;
  String category_total_wall;

  arrayImagesCategory({
    this.cid,this.category_image,
    this.category_image_thumb,this.category_name,this.category_total_wall,
    });

  factory arrayImagesCategory.fromJson(Map<String, dynamic> json) {
    return arrayImagesCategory(
      cid : json['cid'],
      category_name : json['category_name'],
      category_image : json['category_image'],
      category_image_thumb : json['category_image_thumb'],
      category_total_wall: json['category_total_wall']
    );
  }
}

class categoryList{
  final List<arrayImagesCategory> listCategory;
  categoryList({this.listCategory});

  factory categoryList.fromJson(List<dynamic> json){
    List<arrayImagesCategory> listCategory = new List<arrayImagesCategory>();
    listCategory = json.map((i)=>arrayImagesCategory.fromJson(i)).toList();
    return categoryList(listCategory: listCategory);
  }
}