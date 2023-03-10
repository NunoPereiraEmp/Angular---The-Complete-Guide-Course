import { Directive, ElementRef, HostBinding, HostListener, Input, Renderer2 } from '@angular/core';

@Directive({
  selector: '[appBetterHighlightInput]'
})
export class BetterHighlightInputDirective {

  @Input()
  defaultColor:string="transparent";
  @Input()
  highlightColor:string="blue";

  /**forma mais facil de mudar de cor sem usar o renderer */
  @HostBinding('style.backgroundColor') 
  backgroundColor:string;


  constructor(private elRef:ElementRef ,private renderer:Renderer2) { }

  /**antes de ser renderizado mas depois dos valores estarem disponiveis */
  ngOnInit(): void {
    this.backgroundColor=this.defaultColor;
    this.renderer.setStyle(this.elRef.nativeElement,"background-color","blue");
  }

  /** forma mais interativa de injetar codigo */
  @HostListener("mouseenter") 
  mouseover(eventData:Event){
    //this.renderer.setStyle(this.elRef.nativeElement,"background-color","red");
    this.backgroundColor=this.highlightColor;
  }

  @HostListener("mouseleave") 
  mouseleave(eventData:Event){
    //this.renderer.setStyle(this.elRef.nativeElement,"background-color","transparent");
    this.backgroundColor=this.defaultColor;
  }

}
