import { AfterContentChecked, AfterContentInit, AfterViewChecked, AfterViewInit, Component, DoCheck, Input, OnChanges, OnDestroy, OnInit, SimpleChanges, ViewEncapsulation } from '@angular/core';

//este component vai ter os servidores individuais 
// encapsulation: ViewEncapsulation.None -> permite que os estilos de css sejam globais
@Component({
  selector: 'app-server-element',
  templateUrl: './server-element.component.html',
  styleUrls: ['./server-element.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class ServerElementComponent implements OnInit, OnChanges, DoCheck, AfterContentInit, AfterContentChecked, AfterViewInit, AfterViewChecked, OnDestroy {
  //o decorator @Input() permite que os components pais consigam aceder á variável elemnt, neste caso, 
  //é um costum property binding

  @Input()
  element: { type: string, name: string, content: string };
  @Input()
  name: string;



  constructor() {//1ª
    console.log("constructor");
  }
    
  ngOnChanges(changes: SimpleChanges): void {//2ª
    //Called before any other lifecycle hook. Use it to inject dependencies, but avoid any serious work here.
    //Add '${implements OnChanges}' to the class.
    console.log("ngOnChanges");

  }

  ngOnInit(): void {//3ª
    console.log("ngOnInit");
  }

  ngDoCheck(): void { //4ª
    console.log("ngdocheck");
  }

  ngAfterContentInit(): void {//5ª
    console.log("ngAfterContentInit");
  }

  ngAfterContentChecked(): void {
    console.log("ngAfterContentChecked");
  }

  ngAfterViewChecked(): void {
    console.log("ngAfterViewChecked");
  }
  ngAfterViewInit(): void {
    console.log("ngAfterViewInit");
  }

  ngOnDestroy(): void {
    console.log("ngOnDestroy");
  }

}
