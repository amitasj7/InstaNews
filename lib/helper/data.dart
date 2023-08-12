import 'package:newsapp2/helper/models/category_model.dart';

List<CategorieModel> getCategories() {
  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categoriesModel;

//1
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Business";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";

  myCategories.add(categoriesModel);

  //2
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Entertainment";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  //3
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "General";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categoriesModel);

  //4
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Health";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categoriesModel);

  //5
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Science";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categoriesModel);

  //6
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Sports";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  //7
  categoriesModel = CategorieModel();
  categoriesModel.categorieName = "Technology";
  categoriesModel.imageAssetUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categoriesModel);

  return myCategories;
}
