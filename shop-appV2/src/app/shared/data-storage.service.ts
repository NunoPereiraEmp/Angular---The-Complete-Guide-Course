import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Recipe } from "../recipes/recipe.model";
import { RecipeService } from "../recipes/recipe.service";
import { map, tap } from "rxjs/operators";

@Injectable({providedIn: 'root'})
export class DataStorageService{

    constructor(private http:HttpClient,private recipeService: RecipeService){}

    storeRecipes(){
        const recipes = this.recipeService.getRecipes();
        this.http.put('https://shoppapp-7a0bd-default-rtdb.europe-west1.firebasedatabase.app/recipes.json', recipes).subscribe(response=>{
            console.log(response);
        });
    }

    fetchRecipes(){
        return this.http.get<Recipe[]>('https://shoppapp-7a0bd-default-rtdb.europe-west1.firebasedatabase.app/recipes.json')
        .pipe(map(recipes=>{
            return recipes.map(recipe =>{
                return {...recipe, ingredients: recipe.ingredients ? recipe.ingredients: [] };
            });
        }),//serve só para executar codigo  sem alterar o observable
        tap(recipes=>{
            this.recipeService.setRecipes(recipes);
        }))
    }
}