# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

major_category_names = ["設計", "施工", "仕上げ"]
design_categories = ["図面"]
work_categories = ["現場調査", "鋼材加工取り付け", "ケーブル敷設、撤去","電源装置切り替え", "重量運搬"]
finish_categories = ["テスト", "ケイカル", "施工管理書"]

major_category_names.each do |major_category_name|
  if major_category_name == "設計"


    design_categories.each do |design_category|
      Category.create(
        name: design_category,
        description: design_category,
        major_category_name: major_category_name
      )
    end
  elsif major_category_name == "施工"
    work_categories.each do |work_category|
      Category.create(
        name: work_category,
        description: work_category,
        major_category_name: major_category_name
      )
    end
  elsif major_category_name == "仕上げ"
    finish_categories.each do |finish_category|
      Category.create(
        name: finish_category,
        description: finish_category,
        major_category_name: major_category_name
      )
    end
  end
end
