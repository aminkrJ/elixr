if IngredientCategory.count.zero?
  IngredientCategory.create [{description: "grain (cereal) foods", title: 'ic_1'}, {description: "lean meats and poultry", title: 'ic_2'}, {description: "dairy products", title: 'ic_3'}, {description: "vegtables", title: 'ic_4'}, {description: "beans and nuts", title: 'ic_5'}, {description: "fruits", title: 'ic_6'}, {description: "super foods", title: 'ic_7'}]
end
