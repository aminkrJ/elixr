if IngredientCategory.count.zero?
  IngredientCategory.create [{description: "grain (cereal) foods", title: 'ic_1'}, {description: "lean meats and poultry", title: 'ic_2'}, {description: "dairy products", title: 'ic_3'}, {description: "vegtables and beans", title: 'ic_4'}, {description: "vegtables", title: 'ic_5'}, {description: "beans and nuts", title: 'ic_6'}, {description: "fruits", title: 'ic_7'}, {description: "super foods", title: 'ic_8'}]
end
