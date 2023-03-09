import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-odd',
  templateUrl: './odd.component.html',
  styleUrls: ['./odd.component.css']
})
export class OddComponent {
  @Input()
  number:number=-1;

  getNumber(number:number){

    if(number%0!=2)this.number= number;
    
  }

}
