import { Directive, ElementRef, OnInit } from "@angular/core";
/*neste caso o appBasicHighlight é um atribute selector, já que muda a cor do background do p porque foi chamado lá
esta forma direta não é a melhor, a melhor está em better-highlight.directive,
directive serve para injetar codigo
*/
@Directive({
    selector:"[appBasicHighlight]"
})
export class BasicHighlightDirective implements OnInit{
    constructor(private elementRef:ElementRef){

    }
    ngOnInit(): void {
        this.elementRef.nativeElement.style.background='green';
    }
}