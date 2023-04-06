import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { Ingredient } from 'src/app/shared/ingredient.model';
import { ShoppingListService } from '../shopping-list.service';
import { NgForm } from '@angular/forms';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-shopping-edit',
  templateUrl: './shopping-edit.component.html',
  styleUrls: ['./shopping-edit.component.css']
})
export class ShoppingEditComponent implements OnDestroy, OnInit {
  @ViewChild('f', {static: false}) slform!: NgForm;

  subscription!: Subscription;
  editMode:boolean=false;
  editedItenIndex!:number;
  editedItem!:Ingredient;

  constructor(private slService: ShoppingListService) { }

  ngOnInit(): void {
    this.subscription = this.slService.startedEditing.subscribe((index:number)=>{
      this.editMode=true;
      this.editedItenIndex= index;
      this.editedItem= this.slService.getIngredient(index);
      this.slform.setValue({
        name: this.editedItem.name,
        amount: this.editedItem.amount,
      })
    });
  }

  onSubmit(form: NgForm) {
    const value = form.value;
    const newIngredient = new Ingredient(value.name, value.amount);

    if(this.editMode) this.slService.updateIngredient(this.editedItenIndex, newIngredient);
    else this.slService.addIngredient(newIngredient);
    this.editMode=false;
    form.reset();

    //this.slService.addIngredient(newIngredient);
  }

  onClear(){
    this.slform.reset()
    this.editMode=false; 
  }

  onDelete(){
    this.slService.deleteIngredient(this.editedItenIndex);
    this.onClear();

  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

}
