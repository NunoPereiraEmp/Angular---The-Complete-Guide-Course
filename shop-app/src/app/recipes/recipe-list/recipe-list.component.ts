import { Component, EventEmitter, Output } from '@angular/core';
import { Recipe } from '../recipe.model';

@Component({
  selector: 'app-recipe-list',
  templateUrl: './recipe-list.component.html',
  styleUrls: ['./recipe-list.component.css']
})
//Recipe[] significa que é um objeto
export class RecipeListComponent {
  recipes: Recipe[]=[
    new Recipe("Teste recipe", "test description 1","https://assets.bonappetit.com/photos/61b775620fb3fcc4cbf036c1/1:1/w_1600,c_limit/20211208%20Spaghetti%20Squash%20with%20Tomato%20Sauce%20and%20Mozarella%20LEDE.jpg"),
    new Recipe("Tecipe2", "test description 2","https://hips.hearstapps.com/hmg-prod/images/delish-200114-baked-avocado-boats-0361-landscape-pflo-jpg-1647890967.jpg")
  ];
  @Output()
  recipeWasSelected = new EventEmitter<Recipe>();

  constructor(){
    
  }

  onRecipeSelected(recipe:Recipe){
    this.recipeWasSelected.emit(recipe);
  }

}
