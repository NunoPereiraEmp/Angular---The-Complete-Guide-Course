import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Recipe } from '../recipe.model';
import { RecipeService } from '../recipe.service';

@Component({
  selector: 'app-recipe-list',
  templateUrl: './recipe-list.component.html',
  styleUrls: ['./recipe-list.component.css']
})
//Recipe[] significa que é um objeto
export class RecipeListComponent implements OnInit {
  recipes!: Recipe[];

  //para injetar o codigo,  tem de ser de um componente pai
  constructor(private recipeService: RecipeService){

  }
  ngOnInit(): void {
    this.recipes= this.recipeService.getRecipes();
  }


}
