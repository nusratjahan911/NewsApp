class CategoryModel{
  String? image;
  String? categoryName;
}

List<CategoryModel> getCategories() {
  List<CategoryModel> categoryList = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.image = 'images/business.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Entertainment';
  categoryModel.image = 'images/entertainment.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'General';
  categoryModel.image = 'images/general.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Health';
  categoryModel.image = 'images/health.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Science';
  categoryModel.image = 'images/science.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Sports';
  categoryModel.image = 'images/sports.png';
  categoryList.add(categoryModel);
  categoryModel = new CategoryModel();

  return categoryList;
}
