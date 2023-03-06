export class Ingredient {
    //definir como é que o ingrediente vai parecer
    //public name:string , ao por isto no construtor faz o processo automatico de uma inicialização automatica
    // de um construtor , isto vai ser usado no shopping-list component
    constructor(public name: string,public amount: number) {}
}
