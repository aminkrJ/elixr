"use strict";

var RecipeFilter = React.createClass({
  getInitialState: function () {
    return { ingredients: [], recipes: [], activeIngredients: [] };
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
  handleIngredientClick: function(){
    $.ajax({
      url: this.props.recipes_path,
      dataType: 'json',
      data: null,
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
          <RecipeList data={this.state.recipes} />
        </div>
      </div>
    );
  }
});

var RecipeList = React.createClass({
  render: function(){
    var recipeNodes = this.props.data.map(function(data){
      return(
        <Recipe key={data.id} data={data} />
      );
    });
    return(
      <div className="RecipeList">
        {recipeNodes}
      </div>
    );
  }
});

var IngredientList = React.createClass({
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
  getInitialState: function(){
    return {clicked: false};
  },
  onClick: function(){
    this.setState({clicked: !this.state.clicked});
    this.props.onClick();
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
  render: function(){
    return(
      <div className="col-sm-5 col-md-5 recipe">
        {this.props.data.title.toLowerCase()}
      </div>
    );
  }
});
