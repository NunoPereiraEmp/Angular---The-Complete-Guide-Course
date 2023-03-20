import {  Injectable, Output } from '@angular/core';
import { Ingredient } from '../shared/ingredient.model';
import { ShoppingListService } from '../shopping-list/shopping-list.service';
import { Recipe } from './recipe.model';

@Injectable()
export class RecipeService {

  private recipes: Recipe[] = [
    new Recipe(
      'Teste recipe',
      'test description 1',
      'https://assets.bonappetit.com/photos/61b775620fb3fcc4cbf036c1/1:1/w_1600,c_limit/20211208%20Spaghetti%20Squash%20with%20Tomato%20Sauce%20and%20Mozarella%20LEDE.jpg',
      [new Ingredient('meat', 1), new Ingredient('french fries', 20)]
    ),
    new Recipe(
      'Tecipe2',
      'test description 2',
      'https://hips.hearstapps.com/hmg-prod/images/delish-200114-baked-avocado-boats-0361-landscape-pflo-jpg-1647890967.jpg',
      [new Ingredient('buns', 2), new Ingredient('meat', 1)]
    ),
  ];

  constructor(private slService: ShoppingListService) { }

  getRecipes() {
    //com o slice recebemos mesmo uma copia.
    return this.recipes.slice();
  }
  getRecipe(id:number){
    return this.recipes[id];
  }

  addIngredientToShoppingList(ingredients: Ingredient[]) {
    this.slService.addIngredients(ingredients);
   }
}
