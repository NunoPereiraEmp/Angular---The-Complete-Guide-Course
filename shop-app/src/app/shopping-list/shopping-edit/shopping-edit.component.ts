import { Component, ElementRef, EventEmitter, Output, ViewChild } from '@angular/core';
import { Ingredient } from 'src/app/shared/ingredient.model';

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
  @Output()
  ingridientAdded = new EventEmitter<Ingredient>();

  onAddItem(){
    const ingName= this.nameInputRef.nativeElement.value;
    const amgName= this.amountInputRef.nativeElement.value;
    const newIngredient =  new Ingredient(ingName, amgName);
    this.ingridientAdded.emit(newIngredient);    
  }

}
