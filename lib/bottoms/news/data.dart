
import 'package:flutter_vk_application/bottoms/news/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://businessexperttips.com/wp-content/uploads/2022/01/3.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://www.xrtoday.com/wp-content/uploads/2021/12/Media_Entertainment_Metaverse_Future_Already_Here-1280x720.jpg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://www.quasa.io/storage/photos/%D0%A4%D0%BE%D1%82%D0%BE%2014/AATR%202.jpeg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8YXFKH18e9-EUfstc90-4j_c2HckMNODEAA&usqp=CAU';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://assets.weforum.org/community/image/3v8PB95CCSn86e5fowthRAybW4ajSY18z2FfVPi2spk.jpeg';
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://cloudinary.hbs.edu/hbsit/image/upload/s--sFv3MZbN--/f_auto,c_fill,h_375,w_750,/v20200101/D730ED9CC0AF1A0C18B3499EF75E86D7.jpg';
  category.add(categoryModel);

  return category;
}