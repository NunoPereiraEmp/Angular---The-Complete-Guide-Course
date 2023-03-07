import { Component, Input, OnInit, ViewEncapsulation } from '@angular/core';

//este component vai ter os servidores individuais 
// encapsulation: ViewEncapsulation.None -> permite que os estilos de css sejam globais
@Component({
  selector: 'app-server-element',
  templateUrl: './server-element.component.html',
  styleUrls: ['./server-element.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class ServerElementComponent implements OnInit {
  //o decorator @Input() permite que os components pais consigam aceder á variável elemnt, neste caso, 
  //é um costum property binding

  @Input()
  element:{type:string, name:string, content:string};

 

  constructor() { }

  ngOnInit(): void {
  }

}
