import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Params } from '@angular/router';
import { RecipeService } from '../recipe.service';

@Component({
  selector: 'app-recipe-edit',
  templateUrl: './recipe-edit.component.html',
  styleUrls: ['./recipe-edit.component.css']
})
export class RecipeEditComponent implements OnInit {
  id!:number;
  editMode = false;
  recipeForm!:FormGroup;
  recipeIngredientsAux!:FormGroup;
  recipeIngredients!:FormArray;

  constructor(private route: ActivatedRoute, private recipeService: RecipeService) { }

  ngOnInit() {
    this.recipeIngredientsAux = new FormGroup({
      'recipeIngredients': new FormArray([]) // Inicialize o FormArray vazio
    });

    this.route.params.subscribe((params:Params) =>{
      this.id= +params['id'];
      //se não tiver id então não está em edit mode
      this.editMode = params['id'] !=null;
      this.initForm();
    });
  }

  onSubmit(){
    console.log(this.recipeForm);
  }

  

  initForm(){
    let recipeName='';
    let recipeImagePath='';
    let recipeDescription='';
    this.recipeIngredients = this.recipeForm.get('recipeIngredients') as FormArray;


    if(this.editMode){
      const recipe = this.recipeService.getRecipe(this.id); 
      recipeName= recipe.name;
      recipeImagePath = recipe.imagePath;
      recipeDescription= recipe.description;
      if(recipe['ingredients']){
        for (let ingredient of recipe.ingredients) {
         this.recipeIngredients.push(
            new FormGroup({
              'name': new FormControl(ingredient.name),
              'amount': new FormControl(ingredient.amount), 

            })
          );
          
        }
      }
    }

    this.recipeForm= new FormGroup({
      'name': new FormControl(recipeName),
      'imagePath': new FormControl(recipeImagePath),
      'description' :  new FormControl(recipeDescription) ,
      'ingredients' : this.recipeIngredients

    });
  }

  getControls(){
    return  (this.recipeForm.get('ingredients') as FormArray).controls;
  }

}
