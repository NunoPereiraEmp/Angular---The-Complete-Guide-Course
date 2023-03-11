import { Component, OnInit } from '@angular/core';
import { Ingredient } from '../shared/ingredient.model';
import { ShoppingListService } from './shopping-list.service';

@Component({
  selector: 'app-shopping-list',
  templateUrl: './shopping-list.component.html',
  styleUrls: ['./shopping-list.component.css']
})
export class ShoppingListComponent implements OnInit{
  ingredients!:Ingredient[];

  constructor(private slSerice: ShoppingListService){}
  ngOnInit(): void {
    this.ingredients= this.slSerice.getIngredient();
    //basicamente como é um evento vai logo para aaqui a baixo  nem passa pela linha a cima, quando o evento é chamado e atualiza a copia
    //ingredients
    this.slSerice.ingredientsChanged.subscribe(
      (ingredients:Ingredient[]) =>{
        this.ingredients=ingredients
      }
    );
  }




}
