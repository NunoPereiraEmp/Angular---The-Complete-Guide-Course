import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { RecipeDetailComponent } from "./recipes/recipe-detail/recipe-detail.component";
import { RecipeEditComponent } from "./recipes/recipe-edit/recipe-edit.component";
import { RecipeStartComponent } from "./recipes/recipe-start/recipe-start.component";
import { RecipesComponent } from "./recipes/recipes.component";
import { ShoppingListComponent } from "./shopping-list/shopping-list.component";


/**
 * precisamos de routes para a nossa 
 * recipe 
 * shopping list
 */
const appRoutess: Routes = [
    {   //como o empty path faz parte de todas as routes, isto é o "" é um prefixo para todas as routes dá erro, porque tenta redirecionar  para todos os caminhos ou routes
        //redireciona apenas se o caminho full está empty, e não redicionará  nos outros caminhos
        //only redirect if the full path is empty, põe como exact match
        path: '', redirectTo: '/recipes', pathMatch: 'full'
    },
    {
        path: 'recipes', component: RecipesComponent, children:[
            {
                path: '', component: RecipeStartComponent
            },
            {
                path: 'new', component: RecipeEditComponent
            },
            {//id do recipe item
                path: ':id', component: RecipeDetailComponent
            },
            {
                path: ':id/edit', component: RecipeEditComponent
            }
            
        ]
    },
    {
        path: 'shopping-list', component: ShoppingListComponent,
    }
]

@NgModule({
    imports: [
        RouterModule.forRoot(appRoutess)
    ],
    //este export é para por no appmodule, portanto no principal
    exports: [RouterModule]
})
export class AppRoutingModule {

}
/*  <app-recipe-detail *ngIf="selectedRecipe ; else infoText"
        [recipe]="selectedRecipe"
        ></app-recipe-detail>
        <ng-template #infoText>
            <p>Please selct a recipe</p>
        </ng-template> */