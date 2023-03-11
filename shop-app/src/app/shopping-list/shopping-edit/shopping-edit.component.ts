import { Component, ElementRef, EventEmitter, Output, ViewChild } from '@angular/core';
import { Ingredient } from 'src/app/shared/ingredient.model';
import { ShoppingListService } from '../shopping-list.service';

@Component({
  selector: 'app-shopping-edit',
  templateUrl: './shopping-edit.component.html',
  styleUrls: ['./shopping-edit.component.css']
})
export class ShoppingEditComponent {
  @ViewChild('nameInput')
  nameInputRef!:ElementRef;
  @ViewChild('amountInput')
  amountInputRef!:ElementRef;

  constructor(private slService: ShoppingListService){}

  onAddItem(){
    const ingName= this.nameInputRef.nativeElement.value;
    const amgName= this.amountInputRef.nativeElement.value;
    const newIngredient =  new Ingredient(ingName, amgName);
    this.slService.addIngredient(newIngredient);
  }

}
