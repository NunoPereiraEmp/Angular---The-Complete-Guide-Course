import { Directive, ElementRef, HostBinding, HostListener, Input, OnInit, Renderer2 } from '@angular/core';

/*esta é a melhor forma, portanto usar o renderer é melhor
já que o angular não está limitado a renderizar o browser,
pois podemos ter ambientes em que podemos não ter acesso ao DOM
*/
@Directive({
  selector: '[appBetterHighlight]'
})
export class BetterHighlightDirective implements OnInit {

  /**forma mais facil de mudar de cor sem usar o renderer */
  @HostBinding('style.backgroundColor') 
  backgroundColor:string="transparent";


  constructor(private elRef:ElementRef ,private renderer:Renderer2) { }

  ngOnInit(): void {
    this.renderer.setStyle(this.elRef.nativeElement,"background-color","blue");
  }

  /** forma mais interativa de injetar codigo */
  @HostListener("mouseenter") 
  mouseover(eventData:Event){
    //this.renderer.setStyle(this.elRef.nativeElement,"background-color","red");
    this.backgroundColor="blue";
  }

  @HostListener("mouseleave") 
  mouseleave(eventData:Event){
    //this.renderer.setStyle(this.elRef.nativeElement,"background-color","transparent");
    this.backgroundColor="transparent";
  }

}
