import { Directive, Input, TemplateRef, ViewContainerRef } from '@angular/core';

@Directive({
  selector: '[appUnless]'
})
export class UnlessDirective {
  /**o set transforma num metodo, mas ainda é uma propriedade 
   * é executado sempre que o parametro muda
   * o nome da função tem de ser o mesmo nome da directive/selector, porque assim chamamos conseguimos
   * por o valor por parametro pelo html que está desta forma <div *appUnless="onlyOdd">
  */
  @Input()
  set appUnless(condition: boolean) {
    /**sempre que a condição muda */
    if (!condition) {
      /**cria uma view no view container */
      this.vcRef.createEmbeddedView(this.templateRef);
    }
    else {
      /**não renderizar nada */
      this.vcRef.clear();
    }

  }
  /**injetar template
   * PORTANTO o template é o que vmos renderizar 
   * e o ViewContainerRef é onde vamos renderizar
   */
  constructor(private templateRef: TemplateRef<any>, private vcRef: ViewContainerRef) {

  }

}
