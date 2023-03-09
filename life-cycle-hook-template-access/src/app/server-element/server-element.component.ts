import { AfterContentChecked, AfterContentInit, AfterViewChecked, AfterViewInit, Component, ContentChild, DoCheck, ElementRef, Input, OnChanges, OnDestroy, OnInit, SimpleChanges, ViewChild, ViewEncapsulation } from '@angular/core';

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

  @ViewChild("heading", { static: true }) header: ElementRef;

  //permite passar  o selector é o id que está no html, basicamente o nome do html
    /*
  Tanto ContentChild quanto ViewChild são decoradores que permitem acessar um elemento do componente filho em um componente pai no Angular.

A principal diferença entre os dois decoradores é que ContentChild é usado para acessar elementos dentro da tag de conteúdo do componente 
filho, enquanto ViewChild é usado para acessar elementos dentro do template do componente filho.
  */
  @ContentChild('contentParagraph', { static: true }) paragraph: ElementRef;


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
    console.log("text content  of paragraph ->", this.paragraph.nativeElement.textContent);
  }

  ngAfterContentChecked(): void {
    console.log("ngAfterContentChecked");
  }

  ngAfterViewChecked(): void {
    console.log("ngAfterViewChecked");
  }
  ngAfterViewInit(): void {
    console.log("ngAfterViewInit");
    console.log("text content ->" + this.header.nativeElement.textContent);
  }

  ngOnDestroy(): void {
    console.log("ngOnDestroy");
  }

}
