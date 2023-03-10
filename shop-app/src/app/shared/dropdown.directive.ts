import { Directive, HostBinding, HostListener } from "@angular/core";

@Directive({
    selector: "[appDropdown]"
})
export class DropdownDirective {
    /**fazer o binding das propriedades do elemento, neste caso á classe
     *  <div class="btn-group">, o open é para ficar assim <div class="btn-group open">, já
     * que este open abre o dropdown
     */
    @HostBinding("class.open")
    isOpen: boolean = false;

    /** @HostListener apenas corre esta func quando um event ocorre neste caso o evento click */
    @HostListener("click")
    toggleOpen() {
        this.isOpen=!this.isOpen;
    }
    /**pode ser usado por qualquer dropdown, por isso, primeiro ele epera por um evento @HostListener("click") e depois
     * de chamar o toggle open  faz o  @HostBinding("class.open") e abre o dropdown
     * chamamos no html pelo selector portanto "appDropdown" mesmo depois da class relacionada do dropdown
     */

}