import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'practicing-data-binding';
  userName:String;
  disable:boolean;

  constructor(){
    this.userName= "";
    this.disable=true;
  }

  ResetUser(){
    this.userName="";
  }

  DisableButton(){
    if(this.userName==="") this.disable=true; else this.disable=false;
    console.log(this.disable);
    return this.disable;
  }
}
