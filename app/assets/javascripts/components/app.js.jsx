"use strict";

var RecipeFilter = React.createClass({
  ingredientIds: [],
  updateIngredientIds: function(id){
    if(_.contains(this.ingredientIds, id)){
      this.ingredientIds = _.without(this.ingredientIds, id)
    }else{
      this.ingredientIds = this.ingredientIds.concat(id)
    }
  },
  getInitialState: function () {
    return { ingredients: [], recipes: [] };
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
  handleIngredientClick: function(ingredient){
    this.updateIngredientIds(ingredient.id);
    $.ajax({
      url: this.props.recipes_path,
      dataType: 'json',
      data: {ids: this.ingredientIds},
      type: 'GET',
      cache: false,
      success: function(data){
        this.setState({ recipes: data });
      }.bind(this),
      error: function(xhr, status, err){
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleRecipeClick: function(recipe){
  },
  render: function(){
    return (
      <div className="recipeFilter row">
        <div className="col-sm-4 col-md-4">
          <IngredientList
            data={this.state.ingredients}
            onIngredientClick={this.handleIngredientClick}
          />
        </div>
        <div className="col-sm-4 col-md-4">
          <RecipeList
            data={this.state.recipes}
            onRecipeClick={this.handleRecipeClick}
          />
        </div>
      </div>
    );
  }
});

var RecipeList = React.createClass({
  render: function(){
    var recipeNodes = this.props.data.map(function(data){
      return(
        <Recipe
          key={data.id}
          data={data}
          onClick={this.props.onRecipeClick}/>
      );
    }, this);
    return(
      <div className="RecipeList">
        {recipeNodes}
      </div>
    );
  }
});

var IngredientList = React.createClass({
  propTypes:{
    onIngredientClick: React.PropTypes.func
  },
  render: function(){
    var ingredientNodes = this.props.data.map(function(data){
      return(
        <Ingredient
          key={data.id}
          data={data}
          onClick={this.props.onIngredientClick} />
      );
    }, this);
    return(
      <div className="IngredientList">
        {ingredientNodes}
      </div>
    );
  },
});

var Ingredient = React.createClass({
  propTypes:{
    onClick: React.PropTypes.func
  },
  getInitialState: function(){
    return {clicked: false};
  },
  onClick: function(){
    this.setState({clicked: !this.state.clicked});
    this.props.onClick(this.props.data);
  },
  render: function(){
    return(
      <div
        className={classNames("col-sm-5 col-md-5 ingredient", {'clicked': this.state.clicked})}
        onClick={this.onClick}>
          {this.props.data.name.toLowerCase()}
      </div>
    );
  },
});

var Recipe = React.createClass({
  getInitialState: function(){
    return {clicked: false};
  },
  onClick: function(){
    this.setState({clicked: !this.state.clicked});
    this.props.onClick(this.props.data);
  },
  render: function(){
    return(
      <div
        className={classNames("col-sm-5 col-md-5 recipe", {'clicked': this.state.clicked})}
        onClick={this.onClick}>
        {this.props.data.title.toLowerCase()}
      </div>
    );
  }
});
