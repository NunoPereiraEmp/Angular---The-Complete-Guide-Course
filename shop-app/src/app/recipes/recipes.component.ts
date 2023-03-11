import { Component, OnInit } from '@angular/core';
import { Recipe } from './recipe.model';
import { RecipeService } from './recipe.service';

@Component({
  selector: 'app-recipes',
  templateUrl: './recipes.component.html',
  styleUrls: ['./recipes.component.css'],
  providers: [RecipeService]
})
export class RecipesComponent implements OnInit {
  selectedRecipe!:Recipe;

  constructor(private recipeService: RecipeService){

  }
  ngOnInit(): void {
    //subscribe to get be informed of any changes
    this.recipeService.recipeSelected.subscribe(
      //este recipe é o que recebemos do evento
      (recipe:Recipe)=>{
        this.selectedRecipe=recipe;
      }
    );
  }


}
