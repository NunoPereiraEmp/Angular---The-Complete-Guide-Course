import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Ingredient } from '../shared/ingredient.model';
import { ShoppingListService } from './shopping-list.service';

@Component({
  selector: 'app-shopping-list',
  templateUrl: './shopping-list.component.html',
  styleUrls: ['./shopping-list.component.css']
})
export class ShoppingListComponent implements OnInit, OnDestroy{
  ingredients!:Ingredient[];
  private igChangeSub!: Subscription;

  constructor(private slSerice: ShoppingListService){}
  ngOnDestroy(): void {
    this.igChangeSub.unsubscribe();
  }
  ngOnInit(): void {
    this.ingredients= this.slSerice.getIngredients();
    //basicamente como é um evento vai logo para aaqui a baixo  nem passa pela linha a cima, quando o evento é chamado e atualiza a copia
    //ingredients
    this.igChangeSub= this.slSerice.ingredientsChanged.subscribe(
      (ingredients:Ingredient[]) =>{
        this.ingredients=ingredients
      }
    );
  }

  onEditItem(index:number){
    this.slSerice.startedEditing.next(index);

  }


}
