"use strict";

var RecipeFilter = React.createClass({
  getInitialState: function () {
    return { ingredients: [] };
  },
  componentDidMount: function(){
    this.loadIngredients();
  },
  loadIngredients: function(){
    $.ajax({
      url: this.props.ingredients_path,
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data){
        this.setState({ ingredients: data });
      }.bind(this),
      error: function(xhr, status, err){
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function () {
    return (
      <div className="recipeFilter row">
        <div className="col-md-4">
          <IngredientList data={this.state.ingredients} />
        </div>
        <div className="col-md-4">
          <RecipeList />
        </div>
        <div className="col-md-4">
          <NutritionFactReport />
        </div>
      </div>
    );
  }
});

var RecipeList = React.createClass({
  render: function(){
    return(null);
  }
});

var IngredientList = React.createClass({
  render: function(){
    var ingredientNodes = this.props.data.map(function(data){
      return(
        <Ingredient key={data.id} data={data} />
      );
    });
    return(
      <div className="IngredientList">
        {ingredientNodes}
      </div>
    );
  },
});

var Ingredient = React.createClass({
  render: function(){
    return(
      <div className="col-md-5 ingredient">
        <h6>
          {this.props.data.name.toLowerCase()}
        </h6>
      </div>
    );
  },
});

var NutritionFactReport = React.createClass({
  render: function(){
    return(null);
  }
});
